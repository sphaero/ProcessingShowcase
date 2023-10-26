float angleX = 0;
float angleY = 0;
float angleZ = 0;
float crossLength = 200;
float crossWidth = 20;

void setup() {
  size(720, 480, P3D);
  noFill();
}

void draw() {
  background(0);
  translate(width / 2, height / 2, 0);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  // Apply a trippy color effect
  float r = map(sin(angleX), -1, 1, 0, 255);
  float g = map(cos(angleY), -1, 1, 0, 255);
  float b = map(sin(angleZ), -1, 1, 0, 255);
  stroke(r, g, b);
  
  drawTrippyCross(crossLength, crossWidth);
  
  angleX += 0.03;
  angleY += 0.04;
  angleZ += 0.05;
}

void drawTrippyCross(float len, float w) {
  float offset = 10 * sin(millis() * 0.01); // Add a dynamic offset
  
  for (int i = -3; i <= 3; i++) {
    float x1 = -len / 2 + offset * i;
    float y1 = -w / 2;
    float z1 = -w / 2;
    float x2 = len / 2 + offset * i;
    float y2 = w / 2;
    float z2 = w / 2;
    
    line(x1, y1, z1, x2, y2, z2);
  }
}
