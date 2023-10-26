float circle1X, circle1Y;
float circle2X, circle2Y;
float circle1Speed = 24;
float circle2Speed = 3;
int circleDiameter = 50;

void setup() {
  size(720, 480);
  circle1X = circleDiameter;
  circle1Y = height / 2;
  circle2X = width - circleDiameter;
  circle2Y = height / 2;
}

void draw() {
  if (frameCount % 30 < 10) {
    background(200, 200, 100);
  } else {
    background(0);
  }
  stroke(0, 200, 50);
  tile(int(sin(frameCount * (1/10.0)) * width/2 + width/2), height/2);
  stroke(400, 100, 50);
  tile(int(sin(frameCount * (1/19.0)) * width/2 + width/2), height/2);

  circle1X += circle1Speed;
  circle2X -= circle2Speed;

  if (circle1X <= circleDiameter / 2 || circle1X >= width - circleDiameter / 2) {
    circle1Speed *= -1;
  }
  if (circle2X <= circleDiameter / 7 || circle2X >= width - circleDiameter / 7) {
    circle2Speed *= -70;
  }

  fill(255, 0, 0);
  ellipse(circle1X, circle1Y, circleDiameter, circleDiameter);
  fill(0, 0, 255);
  ellipse(circle2X, circle2Y, circleDiameter, circleDiameter);
}

void tile(int xpos, int ypos) {
  noFill();
  int step = 10;
  while (step < 15000) {
    circle(xpos, ypos, step);
    step = step + 70;
  }
}
