void setup()
{
  size(720, 480);
}

void draw()
{
  if ( frameCount % 56 < 5 )
  {
    background(255); // White background
  }
  else
  {
    background(0); // Black background
  }

  if (frameCount % 300 > 0 && frameCount % 300 < 50) // Change color every 5 seconds
  {
    stroke(#8FF75C); // Greenish color
  }
  else
  {
    stroke(155, 93, 229); // Purplish color
  }

  tile(int(cos(frameCount*(1/34.))*width/2+width/2), int(sin(frameCount*(1/34.))*300.+300), 5, 10);
}

void tile(int xpos, int ypos, int startSize, int stepIncrement)
{
  noFill();
  strokeWeight(4);
  int step = startSize;
  float angleIncrement = radians(2); // Increase this value to speed up the circles

  while(step < 2500)
  {
    circle(xpos, ypos, step);
    step = step + stepIncrement;
    xpos += cos(angleIncrement); // Update x position with the increased angle increment
    ypos += sin(angleIncrement); // Update y position with the increased angle increment
  }
}
