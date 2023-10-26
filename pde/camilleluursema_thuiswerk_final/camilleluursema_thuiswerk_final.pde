void setup()
{
  size(720, 480);
}

void draw()
{
  if ( frameCount % 29 < 5 )
  {
    background(700, 600, 500);
  }
  else
  {
    background(0);
  }
  stroke(255,255,255);
  tile(int(sin(frameCount*(1/26.))*width/2+width/2), height/2);
  stroke(0,0,0);
  tile(int(sin(frameCount*(1/34.))*width/2+width/9), int(cos(frameCount*(1/34.))*300.+300));
stroke(90,12,70);
  tile(int(sin(frameCount * (10 / 10)) * width / 1 + width / 1), int(cos(frameCount * (1.0 / 74.0)) * 40. + 30));

}

void tile(int xpos, int ypos)
{
  noFill();
  strokeWeight(4);
  int step = 10;
  while(step < 1539)
  {
    ellipse(xpos, ypos, step,2000);
    step = step + 50;
  }
  fill(random(255),random(255),random(255));
  stroke(50,0);
  ellipse(150, 150, 50, 50); // Left eye
  ellipse(550, 350, 50, 50); 
}
