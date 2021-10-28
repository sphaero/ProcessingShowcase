//code deels uit alexander miller zijn video over 90s programming
float t;
float x = 1;
float y = 1;
float a = 0.1;

void setup()
{
  size(720,480);
}
void draw()
{
  background (#000000, 200);
  stroke(255,0,random(255));
  strokeWeight(random(4,10));
  translate(width/2, height/2);
  int bla = 0;
  while(bla < 300)
  { 
  point(x(t), y(t));
  tan(t++);
  bla++;
  }
}

float x(float t)
{
  return tan(t*100)*500;
}
float y(float t)
{
  return cos(t/15)*40;
}
