int margin = 25;
color color1, color2;

void setup() {
  size(720, 480);
  color1 = color(143, 247, 290);
  color2 = color(155, 93, 229);
  smooth(8);
  ellipseMode(RADIUS);
  frameRate(60);
  stroke(color1);
  strokeWeight(3);
  noFill();
}

void draw() {
  background(color2);
  PVector origin = new PVector(width / 2, height / 2);
  float r = (width - margin * 2) / 2;
  circle(origin.x, origin.y, r);
  int waveCount = 100;
  float angleInc = PI / waveCount;
  float timeOffset = radians(frameCount * 3);
  float waveAmp = sin(radians(frameCount * 4.1));
  for (int i = 0; i < waveCount; i++) {
    float angle = PI / 2 + i * angleInc;
    PVector rimPoint = PVector.fromAngle(angle).mult(r).add(origin);
    PVector temp = rimPoint.copy().sub(origin);
    PVector rimPoint2 = new PVector(-temp.x, temp.y).add(origin);
    int pointCount = int(abs(temp.x) / 1);
    float waveMag = 300.0 * waveAmp;
    beginShape();
    for (int j = 0; j <= pointCount; j++) {
      PVector p = PVector.lerp(rimPoint, rimPoint2, 1.0 * j / pointCount);
      float x = map(p.x, rimPoint.x, rimPoint2.x, 0, 1);
      float xFactor = 1 - pow(2 * x - 1, 2); // contain range of waves
      float yFactor = 1 - abs(temp.y / r); // contain range of waves
      float sineValue = sin(2 * PI * x * 3 + timeOffset);
      float yDistortion = yFactor * xFactor * waveMag * sineValue;
      vertex(p.x, p.y + yDistortion);
    }
    endShape();
  }
  println(frameRate);
}
