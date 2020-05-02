float theta=0, r, g, b, max_separation=4, size_ratio=6, separacion=2;
int h=0, blanco=0;
void setup()
{
  size(externals.window.innerWidth/2, externals.window.innerWidth/4, P3D);
  r=random(100,255);
  g=random(100,255);
  b=random(100,255);
}
void draw()
{

  background(0, 20);
  if (blanco>0)
    background(255, 20);
  else
    background(0, 20);
  translate(0, height/2, -500);
  stroke(239, 247, 7, 50);
  for (int e=1;e<=1;e+=2) {
    separacion=map(mouseX, 0, width, 0, max_separation);
    pushMatrix();
    translate(width/2+e*width/3, 0, 0);
    if (e==-1)  
    {
      rotateY(theta);
      rotateX(theta);
      rotateZ(theta);
    }
    if (e==1)
    {
      rotateY(theta);
      rotateX(-theta);
      rotateZ(-theta);
    }
    // rotateY(theta);
    drawSphere(0, 0, 0, mouseY/size_ratio, 100, 100, 100, separacion);
    drawSphere(0, height/4, 0, mouseY/size_ratio, r, g, b, separacion);
    drawSphere(0, -height/4, 0, mouseY/size_ratio, r, g, b, separacion);
    drawSphere(0, 0, height/4, mouseY/size_ratio, r, g, b, separacion);
    drawSphere(0, 0, -height/4, mouseY/size_ratio, r, g, b, separacion);
    popMatrix();
  }
  theta+=0.02;
  h+=100;
  if (h==10000)
    h=0;
}

void drawSphere(float x, float y, float z, float radio, float r, float g, float b, float divisor)
{
  pushMatrix();
  translate(x, y, z);
  // if (blanco>0)
    stroke(0, 60);
  // else
    // stroke(255, 60);
  strokeWeight(1);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(radio/divisor, 0, 0);
  endShape();
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(-radio/divisor, 0, 0);
  endShape();
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, radio/divisor, 0);
  endShape();
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, -radio/divisor, 0);
  endShape();
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, 0, radio/divisor);
  endShape();
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, 0, -radio/divisor);
  endShape();
  fill(r, g, b);
  // noStroke();
  box(radio);
  if (radio>20)
  {
    drawSphere(radio/divisor, 0, 0, radio/2, r, 0, b, divisor);
    drawSphere(-radio/divisor, 0, 0, radio/2, r, g, 0, divisor);
    drawSphere(0, radio/divisor, 0, radio/2, 0, g, b, divisor);
    drawSphere(0, -radio/divisor, 0, radio/2, r, g, 0, divisor);
    drawSphere(0, 0, radio/divisor, radio/2, r, 0, b, divisor);
    drawSphere(0, 0, -radio/divisor, radio/2, 0, g, b, divisor);
  }
  popMatrix();
}
void mouseReleased()
{
  blanco*=-1;
}
void keyPressed()
{

  r=random(255);
  g=random(255);
  b=random(255);
}