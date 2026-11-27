// Particle network for the ideas-page hero.
// Based on the particle-network sketch by the author, with:
//  - a restrained palette taken from the page (champagne, copper, sage, platinum, ice)
//  - connections drawn as translucent shapes whose opacity fades with distance
//  - the simulation in CSS-pixel units (LW x LH), drawn at device resolution (S = devicePixelRatio, capped at 2)
//  - inverted when the page is in light mode: a light background with deep, darker tones
//    (only on the ideas page; anywhere else it stays dark)
//  - performance: a spatial grid replaces the all-pairs check, the device pixel ratio is capped,
//    nothing is allocated per bead per frame

int tam=0;                      // particle count, set in setup() from the canvas area
float tu=1,dista_max=11,radio=10;   // link distance up from 7, a bit under double
float S=1;                      // device pixel ratio (capped)
float LW=1, LH=1;               // logical size in CSS pixels
particula[] p;
int[] kind;                     // which palette colour each bead uses
boolean light = false;          // true when the ideas page is in light mode
boolean onIdeas = false;        // true when the canvas sits on the ideas page (checked once)

// spatial grid: beads are bucketed into cells one link-length wide
float cs = 1;                   // cell size in CSS pixels
int gc = 1, gr = 1;             // grid columns and rows
int[] head, nxt, cellOfBead;    // first bead per cell, next bead in the same cell, cell of each bead

// elegant palette for the dark page
color[] PAL = {
  color(240,178,104),   // amber
  color(232,132,88),    // burnt orange
  color(246,200,150),   // apricot
  color(236,206,170),   // warm cream
  color(196,108,70)     // deep copper
};

// the same families, deepened for the light page
color[] PALL = {
  color(150,78,40),     // deep copper
  color(176,96,56),     // burnt orange
  color(138,109,59),    // bronze
  color(120,86,60),     // umber
  color(70,104,94)      // sage slate
};

color BG_DARK = color(14,13,11);
color BG_LIGHT = color(243,246,246);

// true on the ideas page while it is in light mode; the events page has no toggle and stays dark
boolean isLight()
{
  if (!onIdeas) return false;
  return !externals.window.document.documentElement.classList.contains("dark-mode");
}

void setup()
{
  // a 3x phone screen paints 2.25x the pixels of a 2x one with no visible gain, so cap it
  S = min(externals.window.devicePixelRatio, 2);
  LW = externals.canvas.clientWidth;
  LH = externals.canvas.clientHeight;
  onIdeas = externals.canvas.closest(".ideas-page") != null;
  size(int(LW*S), int(LH*S));
  // full frame rate on every device: a capped rate looked choppy on phones
  frameRate(60);
  // bead size follows the canvas area: 10px on desktop, down to 4px on a phone, so they don't crowd
  radio = constrain(10*sqrt(LW*LH/(1200.0*660)), 4, 10);
  // a calm field: about 260 beads on the desktop banner, fewer on small screens
  tam = int(constrain(260*(LW*LH)/(1200.0*660), 90, 260));
  p = new particula[tam];
  kind = new int[tam];
  for(int i=0;i<tam;i++)
  {
    kind[i] = int(random(PAL.length));
    p[i] = new particula(random(LW),random(LH),random(-1,1),random(-1,1),radio,p,PAL[kind[i]],i);
  }
  dista_max*=p[0].r;

  // grid sized once: cells are at least one link-length wide, plus slack for beads moving between rebuilds
  cs = dista_max + 4;
  gc = int(LW/cs)+1;
  gr = int(LH/cs)+1;
  head = new int[gc*gr];
  nxt = new int[tam];
  cellOfBead = new int[tam];
}

void draw()
{
  light = isLight();
  color BG = light ? BG_LIGHT : BG_DARK;
  color[] P = light ? PALL : PAL;
  background(BG);

  // follow the page theme: each bead takes its colour from the current palette
  for(int i=0;i<tam;i++)
    p[i].col = P[kind[i]];

  // the pointer always repels nearby beads: no click needed (scalar maths, no allocations)
  for(int i=0;i<tam;i++)
  {
    float dx = p[i].pos[0]-mouseX;
    float dy = p[i].pos[1]-mouseY;
    float d = sqrt(dx*dx + dy*dy);
    if(d<100)
    {
      float push = d*0.01;
      float angulo = atan2(dy,dx);
      p[i].vel[0]+=cos(angulo)*push;
      p[i].vel[1]+=sin(angulo)*push;
    }
  }

  // move every bead first, so the grid is built from where beads are now
  for(int i=0;i<tam;i++)
  {
    p[i].pared();
    p[i].mover();
  }

  // bucket beads into the grid
  for(int c=0;c<head.length;c++) head[c]=-1;
  for(int i=0;i<tam;i++)
  {
    int cx = constrain(int(p[i].pos[0]/cs),0,gc-1);
    int cy = constrain(int(p[i].pos[1]/cs),0,gr-1);
    int c = cy*gc+cx;
    cellOfBead[i] = c;
    nxt[i] = head[c];
    head[c] = i;
  }

  // All coordinates below are CSS pixels; scale() maps them onto the denser buffer.
  pushMatrix();
  scale(S);
  for(int i=0;i<tam;i++)
  {
    // only beads in the same or a neighbouring cell can be within link distance
    int c = cellOfBead[i];
    int cx = c % gc;
    int cy = c / gc;
    for(int ny=int(max(0,cy-1)); ny<=int(min(gr-1,cy+1)); ny++)
      for(int nx=int(max(0,cx-1)); nx<=int(min(gc-1,cx+1)); nx++)
        for(int j=head[ny*gc+nx]; j!=-1; j=nxt[j])
          if(j>i) p[i].colision(p[j]);
    p[i].pintar();
  }
  popMatrix();
}

// Blend two palette colours with a given opacity, for the connections.
color link(color a, color b, float alpha)
{
  return color((red(a)+red(b))/2, (green(a)+green(b))/2, (blue(a)+blue(b))/2, alpha);
}

class particula
{
  float[] pos = new float[2],vel = new float[2];
  float r;
  particula[] o;
  int id,grupo;
  color col;

  particula(float px,float py,float vx,float vy,float r_,particula[] o_,color c,int id_)
  {
    pos[0]=px;
    pos[1]=py;
    vel[0]=vx;
    vel[1]=vy;
    r=r_;
    o=o_;
    col=c;
    id=id_;
  }

  void mover()
  {
    // damping: pushes from the pointer and collisions fade out over time
    vel[0]*=0.985;
    vel[1]*=0.985;
    float sp = sqrt(vel[0]*vel[0] + vel[1]*vel[1]);
    // keep a gentle minimum drift so beads never fully stop
    if(sp>0 && sp<0.25)
    {
      vel[0]*=0.25/sp;
      vel[1]*=0.25/sp;
    }
    // cap the speed so the pointer can't send beads flying
    if(sp>2)
    {
      vel[0]*=2/sp;
      vel[1]*=2/sp;
    }
    pos[0]+=vel[0];
    pos[1]+=vel[1];
  }

  void pared()
  {
    if(pos[0]-r<0)
    {
      vel[0]*=-1;
      pos[0]=r;
    }
    if(pos[0]+r>LW)
    {
      vel[0]*=-1;
      pos[0]=LW-r;
    }
    if(pos[1]-r<0)
    {
      vel[1]*=-1;
      pos[1]=r;
    }
    if(pos[1]+r>LH)
    {
      vel[1]*=-1;
      pos[1]=LH-r;
    }
  }

  void pintar()
  {
    // brightness follows speed: slow beads stay dim, fast ones glow
    // toward warm white on the dark page, or toward ink on the light page
    float speed = sqrt(vel[0]*vel[0] + vel[1]*vel[1]);
    float s = constrain(map(speed,0.25,1.0,0,1),0,1);
    color c = light
      ? lerpColor(col, color(30,40,42), 0.45*s)
      : lerpColor(col, color(255,250,240), 0.9*s);

    noStroke();
    // soft halo, then the bead itself
    fill(red(c), green(c), blue(c), 12 + 40*s);
    ellipse(pos[0],pos[1],r*3.6,r*3.6);
    fill(c, 150 + 105*s);
    ellipse(pos[0],pos[1],r*1.6,r*1.6);
  }

  // Collision and link between this bead and another one (o_). draw() only passes nearby beads.
  void colision(particula o_)
  {
    float dx = o_.pos[0]-pos[0];
    float dy = o_.pos[1]-pos[1];
    float dis = sqrt(dx*dx + dy*dy);
    if(dis>=dista_max) return;
    float angulo = atan2(dy,dx);
    float angulo1 = atan2(-dy,-dx);
    float e = map(dis,2*r,dista_max,1,180);

    if(dis<r+o_.r)
    {
      // touching: a solid, slightly brighter link
      fill(link(col,o_.col,190));
      vel[0]-=cos(angulo)*tu;
      vel[1]-=sin(angulo)*tu;
      o_.vel[0]+=cos(angulo)*tu;
      o_.vel[1]+=sin(angulo)*tu;
      pos[0]-=(r*2-dis)*cos(angulo);
      pos[1]-=(r*2-dis)*sin(angulo);
      beginShape();
      vertex(pos[0]+r*cos(angulo-PI/4),pos[1]+r*sin(angulo-PI/4));
      vertex(pos[0]+r*cos(angulo+PI/4),pos[1]+r*sin(angulo+PI/4));
      vertex(o_.pos[0]+o_.r*cos(angulo+PI/4),o_.pos[1]+o_.r*sin(angulo+PI/4));
      vertex(o_.pos[0]+o_.r*cos(angulo-PI/4),o_.pos[1]+o_.r*sin(angulo-PI/4));
      vertex(pos[0]+r*cos(angulo-PI/4),pos[1]+r*sin(angulo-PI/4));
      endShape();
    }
    else
    {
      // a fine link whose opacity fades with distance
      float a = map(dis,2*r,dista_max,175,0);
      // the faintest links are invisible but still cost a shape each: skip them
      if(a<20) return;
      fill(link(col,o_.col,a));
      beginShape();
      vertex(pos[0]+r*cos(angulo+PI/e+PI/4),pos[1]+r*sin(angulo+PI/e+PI/4));
      bezierVertex(pos[0]+r*cos(angulo+PI/e),pos[1]+r*sin(angulo+PI/e),o_.pos[0]+o_.r*cos(angulo1-PI/e),o_.pos[1]+o_.r*sin(angulo1-PI/e),o_.pos[0]+o_.r*cos(angulo1-PI/e-PI/4),o_.pos[1]+o_.r*sin(angulo1-PI/e-PI/4));
      vertex(o_.pos[0]+o_.r*cos(angulo1+PI/e+PI/4),o_.pos[1]+o_.r*sin(angulo1+PI/e+PI/4));
      bezierVertex(o_.pos[0]+o_.r*cos(angulo1+PI/e),o_.pos[1]+o_.r*sin(angulo1+PI/e),pos[0]+r*cos(angulo-PI/e),pos[1]+r*sin(angulo-PI/e),pos[0]+r*cos(angulo-PI/e-PI/4),pos[1]+r*sin(angulo-PI/e-PI/4));
      vertex(pos[0]+r*cos(angulo+PI/e+PI/4),pos[1]+r*sin(angulo+PI/e+PI/4));
      endShape();
    }
  }
}
