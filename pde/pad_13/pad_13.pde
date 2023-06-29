int color1 = color(255, 113, 52);
int color2 = color(255, 219, 88);
int color3 = color(235, 215, 168);

float angle1 = 0;
float angle2 = 0;
float speed1 = 0.05;
float speed2 = 0.1;

void setup() {
  size(800, 600);
  smooth();
}

void draw() {
  
  translate(width / 2, height / 2);
  
  // First spinning circle
  float x1 = sin(angle1) * width / 4;
  float y1 = cos(angle1) * height / 4;
  
  float colorRatio1 = map(sin(angle1), -1, 1, 0, 1);
  int blendedColor1 = lerpColor(color1, color2, colorRatio1);
  
  fill(blendedColor1);
  noStroke();
  ellipse(x1, y1, 200, 200);
  
  // Second spinning circle
  float x2 = sin(angle2) * width / 8;
  float y2 = cos(angle2) * height / 8;
  
  float colorRatio2 = map(cos(angle2), -1, 1, 0, 1);
  int blendedColor2 = lerpColor(color2, color3, colorRatio2);
  
  fill(blendedColor2);
  noStroke();
  ellipse(x2, y2, 100, 100);
  
  angle1 += speed1;
  angle2 += speed2;
}
