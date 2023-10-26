
float tubeRadius = 100;
float tubeHeight = 200;
int tubeDetail = 50;
float angleIncrement;

void setup() {
  size(720, 480, P3D);
  angleIncrement = TWO_PI / tubeDetail;
}

void draw() {
  background(0);
  translate(width / 4, height / 2); // Position the first tube
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  
  fill(155,93,229); // Purple color
  drawTube();

  translate(width / 2, 0); // Position the second tube
  fill(143, 247, 92); // Bright green color (#8FF75C)
  drawTube();
}

void drawTube() {
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += angleIncrement) {
    float x = cos(angle) * tubeRadius;
    float z = sin(angle) * tubeRadius;
    vertex(x, -tubeHeight / 2, z);
    vertex(x, tubeHeight / 2, z);
  }
  endShape(CLOSE);
}
