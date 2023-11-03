void setup()
{
  size(720, 480);
}

void draw()
{
  if ( frameCount % 50 < 20 )
  {
    background(255, 255, 255);
  }
  else
  {
    background(0, 0, 0);
  }
  stroke(155,93,229);
  tile(int(sin(frameCount*(1/50.))*width/2+width/2), int(cos(frameCount*(1/10.))*1000.+300));
  stroke(143,247,92);
  tile(int(sin(frameCount*(1/5.))*width/2+width/5), int(cos(frameCount*(1/25.))*1000.+300));
  stroke(155,93,229);
  tile(int(sin(frameCount*(1/5.))*width/2+width/2), int(cos(frameCount*(1/10.))*1000.+300));
  stroke(143,247,92);
  tile(int(sin(frameCount*(1/20.))*width/2+width/5), int(cos(frameCount*(1/25.))*1000.+300));

}

void tile(int xpos, int ypos)
{
  noFill();
  strokeWeight(6);
  int step = 5;
  while(step < 400)
  {
    circle(xpos, ypos, step);
    step = step + 15;
  }
}
