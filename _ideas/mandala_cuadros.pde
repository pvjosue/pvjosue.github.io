//import processing.opengl.*;
//import processing.video.*;
//MovieMaker mm;
float theta=0.1,tam=100,r=10;
color col=0;
void setup()
{
  size(externals.window.innerWidth/2, externals.window.innerWidth/2, OPENGL);
  background(255);
 // mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.H263,
 // MovieMaker.HIGH);
 rectMode(CENTER);
  mouseX = width/2;
  mouseY = height/2;
}
void draw()
{
  stroke(col);
  if(mousePressed)
  {
  col=color(random(255),random(255),random(255));
  background(0);
  }
  pushMatrix();
  translate(width/3,height/3);
  rotate(-theta);
  for(float x=0;x<2*PI;x+=PI/16)
  {
    fill(random(255),random(255),random(255));
    rect(tam*cos(x),tam*sin(x),r,r);
  }
  popMatrix();
  pushMatrix();
  translate(2*width/3,height/3);
  rotate(theta);
  for(float x=0;x<2*PI;x+=PI/16)
  {
    fill(random(255),random(255),random(255));
    rect(tam*cos(x),tam*sin(x),r,r);
  }
  popMatrix();
    pushMatrix();
  translate(width/3,2*height/3);
  rotate(-theta);
  for(float x=0;x<2*PI;x+=PI/16)
  {
    fill(random(255),random(255),random(255));
    rect(tam*cos(x),tam*sin(x),r,r);
  }
  popMatrix();
  pushMatrix();
  translate(2*width/3,2*height/3);
  rotate(theta);
  for(float x=0;x<2*PI;x+=PI/16)
  {
    fill(random(255),random(255),random(255));
    rect(tam*cos(x),tam*sin(x),r,r);
  }
  popMatrix();
    pushMatrix();
  translate(width/2,height/2);
  rotate(theta);
  for(float x=0;x<2*PI;x+=PI/16)
  {
    noStroke();
    fill(0);
    rect(tam*cos(x),tam*sin(x),r,r);
  }
  popMatrix();
  tam= map(mouseX,0,width,0,width/2);
  r = map(mouseY,0,height,0,50);
  theta+=0.05;
 // mm.addFrame();
}
void keyPressed() {
if (key == ' ') {
println( "finishing movie ");
//mm.finish(); // Finish the movie if space bar is pressed!
}
}