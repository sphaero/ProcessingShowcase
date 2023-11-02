
//Pattern 22
//clicks erbij, MCPA
//Khetieq

import netP5.*;
import oscP5.*;

OscP5 oscP5;


void setup()
{
  size(720,480);
}

void draw()
{
  if (frameCount % 20 < 5)
  {
   background (0, 0, 50);
  }
  
  else
  {
   background (0);
  }
tile(int(sin(frameCount*(1/1.0))*width/2+width/2), height/2);
}

void tile(int xpos, int ypos)
{
  strokeWeight(4);
  stroke(155, 93, 229);
  line(xpos, ypos, 20,80);
  line(xpos, ypos, 90,90);
  line(xpos, ypos, 300,400);
  line(xpos, ypos, 430, 10);
  
  stroke(143, 247, 92);
  line(xpos, ypos, 24, 800);
  line(xpos, ypos, 500,20);
  line(xpos, ypos,200,400);

  
   float t = (float)frameCount;
  
  translate(width/2, height/2);
  noFill();
  strokeWeight(2);
  stroke(255,255,255);
  ellipse(sin(t/50)*50, cos(t/50)*50, 50, 50);
}
