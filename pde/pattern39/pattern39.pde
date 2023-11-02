void setup()
{
  size(720,480);
}

void draw()
{
  if (frameCount % 12 < 6)
  {
  background(0,0,100);
  }
  else
  {
    background(0);
  }
   stroke(159,205,82);
  tile(int(sin(frameCount*(1/10.0))*width/2+width/2), height/2);
  stroke(132,98,170);
  tile(int(sin(frameCount*(1/15.0))*width/2+width/5), height/2);
  
  fill(255);
  textSize(20);
  text("Congolais Pattern 39",260, 400);
}

void tile(int xpos, int ypos)
{
  noFill();
  strokeWeight(3);
  int step = 10;
  while(step < 1500)
  {
  
  circle(xpos, ypos,step);
  step = step +15;
  }
}
