int count = 0;
int delta = 1;
void setup()
{
  size(720, 480);
  stroke(255);
}
void draw() {
  if(frameCount % 5 == 0)
  {
  background(0);
  for (int x = 3; x < 720; x += 20){
    //fill(
    fill((0),(225), (102));
    for (int y = 20; y < 480; y += 20) {
      rect(x, y, random(28), random(32));
    }
  }
 }
  
  fill(0);
  noStroke();
  circle(count,height/2, 100);
  if (count > width){
    delta = -1;
  }
  if (count < 0)
  {
    delta = 1;
  }
  count = count + delta;
}
