void setup()
{
  size(720,480);
}

void draw()
{
  background(0);
  fill(255);
  float speed = 0.20;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*100;
  translate(width/2, height/2);
  square(0,0,100+delta);
  
  fill(255);
  circle (0,0,100+delta);
  fill(255,0,0);
  square(200,200,-100+delta);
  fill(255);
  square(0,0,100+delta);
  fill(255,0,0);
  square(-200,-200,100+delta);
  fill(255);
  square(0,0,-100+delta);
  
  fill(255);
   circle (200,200,100+delta);
    circle(-200,-200,100+delta);

  
}
