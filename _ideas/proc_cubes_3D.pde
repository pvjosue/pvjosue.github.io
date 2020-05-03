
float theta=0,r,g,b,separacion=2;
void setup()
{
  size(externals.window.innerWidth/2, externals.window.innerWidth/4, P3D);
r=random(255);
g=random(255);
b=random(255);
}
void draw()
{
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  pointLight(255,255,255,0,0,0);
// translate(width/3,height/2,0);
translate(0,0,-200);
background(0);
// stroke(139,147,107);
// stroke(0);
for(int e=1;e<=1;e++){
  //background(0);
  if(mousePressed)
  {
    theta*=-1;
  }
  separacion=map(mouseX,0,width,0,3);
  pushMatrix();
  translate(2*width/3,height/2,0);
  if(e==2)
    
  {
  rotateY(-theta);
  rotateX(-theta);
  rotateZ(-theta);
  }
  if(e==1)
  {
  rotateY(theta);
  rotateX(theta);
  rotateZ(theta);
  }
//rotateY(theta);
  drawSphere(0,0,0,mouseY/4,100,100,100,separacion);
  drawSphere(0,height/4,0,mouseY/4,r,g,b,separacion);
  drawSphere(0,-height/4,0,mouseY/4,r,g,b,separacion);
  drawSphere(0,0,height/4,mouseY/4,r/3,g/3,b/3,separacion);
  drawSphere(0,0,-height/4,mouseY/4,r/3,g/3,b/3,separacion);
  drawSphere(height/4,0,0,mouseY/4,r/2,g/2,b/2,separacion);
  drawSphere(-height/4,0,0,mouseY/4,r/2,g/2,b/2,separacion);
  popMatrix();
}
theta+=0.05;
}

void drawSphere(float x,float y,float z,float radio,float r,float g,float b,float divisor)
{
  pushMatrix();
  translate(x,y,z);
  fill(r,g,b,200);
  box(radio);
  if(radio>20)
  {
    drawSphere(radio/divisor,0,0,radio/2,r/2,g,b,divisor); 
    drawSphere(-radio/divisor,0,0,radio/2,r/3,g,b,divisor);
    drawSphere(0,radio/divisor,0,radio/2,r,g/2,b,divisor);
    drawSphere(0,-radio/divisor,0,radio/2,r,g/3,b,divisor);
    drawSphere(0,0,radio/divisor,radio/2,r,g,b/2,divisor);
    drawSphere(0,0,-radio/divisor,radio/2,r,g,b/3,divisor);
  }
  popMatrix();
}