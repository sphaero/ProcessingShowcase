void setup()
{
  size(640,360);
  background(0);
}

int value = 255;

void draw()
{
  {
    strokeWeight(20);
    fill(value);
    rect(10,10,620,340);
  }
  {
     strokeWeight(20);
    fill(value+238,84,75);
    rect(10,10,140,340);
  }
  { 
    strokeWeight(20);
    fill(value+0);
    rect(10,140,620,40);
  }
  {
    strokeWeight(20);
    fill(value+0);
    rect(240,140,100,210);
  } 
  {
    strokeWeight(20);
    fill(value);
    rect(400,180,40,170);
  }
  {
    strokeWeight(20);
    fill(value+234,182,44);
    rect(150,60,480,40);
  }
  {
    strokeWeight(20);
    fill(value);
    rect(450,10,80,170);
  }
  {
    strokeWeight(20);
    fill(value+42,46,119);
    rect(400,260,140,90);
  }
}

void mouseMoved() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
