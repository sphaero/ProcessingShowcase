int count = 0;

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
  circle(mouseX,mouseY, 100);
if (count > 255)
 {
   count = 10;
  }
  else
 {
   count = count + 1;
 }
}
