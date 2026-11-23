// Particle network for the events banner, on a dark background.
// Based on the particle-network sketch by the author, with:
//  - a restrained palette taken from the page (champagne, copper, sage, platinum, ice)
//  - connections drawn as translucent shapes whose opacity fades with distance
//  - the simulation in CSS-pixel units (LW x LH), drawn at device resolution (S = devicePixelRatio)

int tam=400;                    // more particles than before (was 200)
float tu=1,dista_max=7,radio=10;
float S=1;                      // device pixel ratio
float LW=1, LH=1;               // logical size in CSS pixels
particula[] p = new particula[tam];

// elegant palette, matching the page's accents
color[] PAL = {
  color(201,169,110),   // champagne (gold)
  color(208,140,107),   // copper
  color(143,184,166),   // sage
  color(220,213,200),   // platinum
  color(158,201,217)    // ice
};
color BG = color(14,13,11);

void setup()
{
  S = externals.window.devicePixelRatio;
  LW = externals.canvas.clientWidth;
  LH = externals.canvas.clientHeight;
  size(int(LW*S), int(LH*S));
  // bead size follows the canvas area: 10px on desktop, down to 4px on a phone, so they don't crowd
  radio = constrain(10*sqrt(LW*LH/(1200.0*660)), 4, 10);
  for(int i=0;i<tam;i++)
    p[i] = new particula(random(LW),random(LH),random(-1,1),random(-1,1),radio,p,PAL[int(random(PAL.length))],i);
  dista_max*=p[0].r;
}

void draw()
{
  background(BG);
  // the pointer always repels nearby beads: no click needed
  for(int i=0;i<tam;i++)
  {
    PVector d = new PVector(p[i].pos[0],p[i].pos[1]);
    d.x-=mouseX;
    d.y-=mouseY;
    if(d.mag()<100)
    {
      float tu=d.mag()*0.01;
      float angulo = atan2(d.y,d.x);
      p[i].vel[0]+=cos(angulo)*tu;
      p[i].vel[1]+=sin(angulo)*tu;
    }
  }

  // All coordinates below are CSS pixels; scale() maps them onto the denser buffer.
  pushMatrix();
  scale(S);
  for(int i=0;i<tam;i++)
  {
    p[i].pared();
    p[i].mover();
    p[i].colision();
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
    // brightness follows speed: slow beads stay dim, fast ones glow toward warm white
    float speed = sqrt(vel[0]*vel[0] + vel[1]*vel[1]);
    float s = constrain(map(speed,0.25,1.0,0,1),0,1);
    color c = lerpColor(col, color(255,250,240), 0.9*s);

    noStroke();
    // soft halo, then the bead itself
    fill(red(c), green(c), blue(c), 10 + 25*s);
    ellipse(pos[0],pos[1],r*3.2,r*3.2);
    fill(c, 120 + 135*s);
    ellipse(pos[0],pos[1],r*1.6,r*1.6);
  }

  void colision()
  {
    for(int i=id+1;i<o.length;i++)
    {
      float dx = o[i].pos[0]-pos[0];
      float dy = o[i].pos[1]-pos[1];
      float dis = sqrt(dx*dx + dy*dy);
      float angulo = atan2(dy,dx);
      float angulo1 = atan2(-dy,-dx);
      float e = map(dis,2*r,dista_max,1,180);

      if(dis<r+o[i].r)
      {
        // touching: a solid, slightly brighter link
        fill(link(col,o[i].col,235));
        vel[0]-=cos(angulo)*tu;
        vel[1]-=sin(angulo)*tu;
        o[i].vel[0]+=cos(angulo)*tu;
        o[i].vel[1]+=sin(angulo)*tu;
        pos[0]-=(r*2-dis)*cos(angulo);
        pos[1]-=(r*2-dis)*sin(angulo);
        beginShape();
        vertex(pos[0]+r*cos(angulo-PI/4),pos[1]+r*sin(angulo-PI/4));
        vertex(pos[0]+r*cos(angulo+PI/4),pos[1]+r*sin(angulo+PI/4));
        vertex(o[i].pos[0]+o[i].r*cos(angulo+PI/4),o[i].pos[1]+o[i].r*sin(angulo+PI/4));
        vertex(o[i].pos[0]+o[i].r*cos(angulo-PI/4),o[i].pos[1]+o[i].r*sin(angulo-PI/4));
        vertex(pos[0]+r*cos(angulo-PI/4),pos[1]+r*sin(angulo-PI/4));
        endShape();
      }
      else if(dis<dista_max)
      {
        // a fine link whose opacity fades with distance
        float a = map(dis,2*r,dista_max,210,0);
        fill(link(col,o[i].col,a));
        beginShape();
        vertex(pos[0]+r*cos(angulo+PI/e+PI/4),pos[1]+r*sin(angulo+PI/e+PI/4));
        bezierVertex(pos[0]+r*cos(angulo+PI/e),pos[1]+r*sin(angulo+PI/e),o[i].pos[0]+o[i].r*cos(angulo1-PI/e),o[i].pos[1]+o[i].r*sin(angulo1-PI/e),o[i].pos[0]+o[i].r*cos(angulo1-PI/e-PI/4),o[i].pos[1]+o[i].r*sin(angulo1-PI/e-PI/4));
        vertex(o[i].pos[0]+o[i].r*cos(angulo1+PI/e+PI/4),o[i].pos[1]+o[i].r*sin(angulo1+PI/e+PI/4));
        bezierVertex(o[i].pos[0]+o[i].r*cos(angulo1+PI/e),o[i].pos[1]+o[i].r*sin(angulo1+PI/e),pos[0]+r*cos(angulo-PI/e),pos[1]+r*sin(angulo-PI/e),pos[0]+r*cos(angulo-PI/e-PI/4),pos[1]+r*sin(angulo-PI/e-PI/4));
        vertex(pos[0]+r*cos(angulo+PI/e+PI/4),pos[1]+r*sin(angulo+PI/e+PI/4));
        endShape();
      }
    }
  }
}
