//import processing.opengl.*;
int r=100;
color col=255;
float theta=0.1,t=0.1, step = 0.005;
void setup()
{
  size(externals.window.innerWidth/2, externals.window.innerWidth/2,P3D);
  background(0);

  fill(random(255),random(255),random(255));
  noStroke();
  lights();
  mouseX = width/2;
  mouseY = height/2;
}
void draw()
{
    noStroke();
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  pointLight(255,255,255,0,0,0);
  if(mousePressed&&mouseButton==LEFT)
    fill(random(255),random(255),random(255));
  if(mousePressed&&mouseButton==RIGHT)
    stroke(random(255),random(255),random(255),170);
  //stroke(0);
  background(0);
  translate(width/2,height/2,-1000);
  rotateX(t);
  for(float x=0;x<2*PI;x+=PI/int(map(mouseX,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500,0,0);
    box(map(mouseY,0,height,1,100));
    popMatrix();
  }
  rotateY(PI);
    for(float x=0;x<2*PI;x+=PI/int(map(mouseX,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500,0,0);
    box(map(mouseY,0,height,1,100));
    popMatrix();
  }
  theta+=step;
  t+=step;
}