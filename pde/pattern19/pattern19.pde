void setup()
{
  size(720, 480);
}

void draw()
{
  if ( frameCount % 58 < 5 )
  {
    background(255, 255, 255);
  }
  else
  {
    background(0, 0, 0);
  }
  stroke(155,93,229);
  tile(int(sin(frameCount*(1/10.))*width/2+width/2), height/2);
  stroke(143,247,92);
  tile(int(sin(frameCount*(1/20.))*width/2+width/5), int(cos(frameCount*(1/34.))*300.+300));
}

void tile(int xpos, int ypos)
{
  noFill();
  strokeWeight(4);
  int step = 10;
  while(step < 1500)
  {
    circle(xpos, ypos, step);
    step = step + 90;
  }
}
