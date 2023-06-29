float angle = 0;
float radius = 200;
float speed = 0.03;
float orbitRadius = 100;

void setup() {
  size(720, 480);
  smooth();
}

void draw() {
  backgroundGradient();
  translate(width / 2, height / 2);

  // Main ball
  float x = radius * cos(angle);
  float y = radius * sin(angle);
  fill(128, 128, 0);
  ellipse(x, y, 50, 50);

  // Orbiting balls
  float orbitX = x + orbitRadius * cos(-angle * 3);
  float orbitY = y + orbitRadius * sin(-angle * 3);
  fill(128, 128, 0);
  ellipse(orbitX, orbitY, 20, 20);

  // Rotating lines
  float lineAngle = angle;
  for (int i = 0; i < 8; i++) {
    float lineX = radius * cos(lineAngle);
    float lineY = radius * sin(lineAngle);
    stroke(235, 215, 168);
    line(0, 0, lineX, lineY);
    lineAngle += TWO_PI / 8;
  }

  // Rotating squares
  float squareAngle = angle;
  for (int i = 0; i < 8; i++) {
    float squareX = orbitRadius * cos(-squareAngle);
    float squareY = orbitRadius * sin(-squareAngle);
    fill(255);
    rect(squareX, squareY, 30, 30);
    squareAngle += TWO_PI / 8;
  }

  // Pulsating circles
  float circleRadius = 50 + sin(angle) * 50;
  fill(255, 219, 88);
  ellipse(0, 0, circleRadius, circleRadius);

  angle += speed;

  // Bounce off the edges
  if (x > width / 2 || x < -width / 2) {
    speed *= -1;
  }
}

void backgroundGradient() {
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    color c = lerpColor(color(128, 128, 0), color(255, 113, 52), inter);
    stroke(c);
    line(0, y, width, y);
  }
}
