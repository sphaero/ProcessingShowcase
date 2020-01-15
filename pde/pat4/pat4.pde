int sq_size = 3;
int x_pos, y_pos;



void setup()
{
  surface.setResizable(true);
  size(720, 380);
  
}

void draw()
{
  int teller = 1;
  while (teller<=1000)
  {
    noStroke();
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, sq_size, sq_size);
    teller=teller+1;
  }
}
