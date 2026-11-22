// Fractal 3D cubes, metallic edition.
// Based on proc_cubes_3D.pde:
//  - rotation at 1/4 of the original speed
//  - one restrained metal family (champagne, platinum) with a deep bronze accent
//  - sharper specular highlights and deeper shadows
//  - a five-light rig and a fine, cool starfield
//  - full-resolution canvas and smoothing, so the edges are not chunky
//  - mouse mappings as in the original sketch (spacing from mouseX, size from mouseY); clicks do nothing

float theta=0, separacion=2;
float ROT_STEP=0.05/8;          // original step was 0.05 (now 1/8 of that)


int NMETAL=3;
color[] metalAlbedo=new color[NMETAL];
color[] metalSpec=new color[NMETAL];

int NSTARS=200;
float[] sx=new float[NSTARS], sy=new float[NSTARS], sz=new float[NSTARS];
float[] sbright=new float[NSTARS], sphase=new float[NSTARS];
int[] stype=new int[NSTARS];

void setup()
{
  // Full resolution: twice the pixels of the original half-size canvas, same 2:1 shape.
  size(externals.window.innerWidth, externals.window.innerWidth/2, P3D);
  smooth();
  mouseX = width/2;
  mouseY = height/2;

  // cold steel (main), graphite (shadowed secondary), ice-cyan (accent)
  metalAlbedo[0]=color(158,168,180); metalSpec[0]=color(236,246,255);
  metalAlbedo[1]=color(64,72,84);    metalSpec[1]=color(190,215,232);
  metalAlbedo[2]=color(96,128,140);  metalSpec[2]=color(150,230,255);

  // starfield: fine, cool points in front of the camera, behind the cubes
  for(int i=0;i<NSTARS;i++)
  {
    sx[i]=random(-0.2*width, 1.2*width);
    sy[i]=random(-0.2*height, 1.2*height);
    sz[i]=random(-1600, -300);
    sbright[i]=random(0.75, 1.0);
    sphase[i]=random(TWO_PI);
    stype[i]=int(random(4));
  }
}

void draw()
{
  background(3,6,10);
  drawStars();
  lightRig();

  noStroke();

  pushMatrix();
  translate(0,0,-200);
  translate(2*width/3,height/2,0);
  rotateY(theta);
  rotateX(theta);
  rotateZ(theta);
  separacion=map(mouseX,0,width,0,3);
  drawSphere(0,0,0,mouseY/4,1,separacion);
  drawSphere(0,height/4,0,mouseY/4,0,separacion);
  drawSphere(0,-height/4,0,mouseY/4,0,separacion);
  drawSphere(0,0,height/4,mouseY/4,2,separacion);
  drawSphere(0,0,-height/4,mouseY/4,2,separacion);
  drawSphere(height/4,0,0,mouseY/4,1,separacion);
  drawSphere(-height/4,0,0,mouseY/4,1,separacion);
  popMatrix();

  theta+=ROT_STEP;
}

void drawStars()
{
  noLights();
  strokeWeight(2.0);
  for(int i=0;i<NSTARS;i++)
  {
    float twinkle=0.9+0.1*sin(frameCount*0.015+sphase[i]);
    float b=sbright[i]*twinkle;
    if(stype[i]==0) stroke(200*b, 215*b, 255*b);       // cool blue-white
    else if(stype[i]==1) stroke(255*b, 246*b, 230*b);  // warm white
    else if(stype[i]==2) stroke(235*b, 200*b, 150*b);  // faint gold
    else stroke(180*b, 200*b, 235*b);                  // pale blue
    point(sx[i], sy[i], sz[i]);
  }
}

// Five lights in total (the runtime allows eight).
void lightRig()
{
  ambientLight(10, 13, 19);

  lightSpecular(245, 250, 255);
  directionalLight(160, 170, 182, 0.3, 0.5, -1);      // cool white key

  lightSpecular(120, 235, 255);
  pointLight(70, 190, 215, 0.95*width, 0.2*height, -380);    // thin cyan rim from the right

  lightSpecular(200, 222, 240);
  pointLight(110, 120, 135, 0.12*width, 0.85*height, -300);  // grey-blue bounce, low left

  lightSpecular(255, 255, 255);
  pointLight(190, 200, 212, 0.5*width, -0.5*height, -900);   // distant top light
}

void metal(int m)
{
  int i=((m%NMETAL)+NMETAL)%NMETAL;
  color a=metalAlbedo[i];
  color s=metalSpec[i];
  fill(a);
  ambient(red(a)*0.12, green(a)*0.12, blue(a)*0.12);
  specular(s);
  shininess(64);
  emissive(0,0,0);
}

void drawSphere(float x, float y, float z, float radio, int m, float divisor)
{
  pushMatrix();
  translate(x,y,z);
  metal(m);
  box(radio);
  if(radio>20)
  {
    drawSphere(radio/divisor,0,0,radio/2,m+1,divisor);
    drawSphere(-radio/divisor,0,0,radio/2,m+2,divisor);
    drawSphere(0,radio/divisor,0,radio/2,m+1,divisor);
    drawSphere(0,-radio/divisor,0,radio/2,m,divisor);
    drawSphere(0,0,radio/divisor,radio/2,m+2,divisor);
    drawSphere(0,0,-radio/divisor,radio/2,m+1,divisor);
  }
  popMatrix();
}
