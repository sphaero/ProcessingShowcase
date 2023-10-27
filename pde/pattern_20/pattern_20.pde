float a = 100;
float b = 101;
float d = 3;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  noFill();
  beginShape();
  for (int i = 0; i < 360; i++) {
    float t = radians(i + frameCount); // Introduce frameCount here to make it move
    float x = sin(a * t + radians(d)) * width/4;
    float y = sin(b * t) * height/4;
    vertex(x, y);
  }
  endShape();
}
