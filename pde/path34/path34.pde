int x_size=10;
int y_size=400;

void setup()
{
  background(180,110,200);
  size(720, 480);
  
  drawStripes();
}

void draw()
{
  drawStripes();
  stroke(150, 20, 200);
  strokeWeight(1);
  fill(random(50,255), 100, 200);
}

void drawStripes()
{
  int x_pos = int(random(0, width-10));
  int y_pos = int(random(0, height-10));
  
  rect(x_pos+5, y_pos+10, x_size, y_size);
  rect(x_pos+25, y_pos+20, x_size, y_size);
  rect(x_pos+45, y_pos+30, x_size, y_size);

}
