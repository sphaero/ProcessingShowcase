void setup() {
  size(720, 480);
}

void draw() {
  if (frameCount % 240 < 0) {
    background(254, 0, 0);
  } else {
    background(254);
  }
  
  float xOffset1 = sin(frameCount * 0.30) * 10;
  float xOffset2 = sin(frameCount * 0.120) * 10;
  
  float yOffset1 = cos(frameCount * 0.10) * 10;
  float yOffset2 = cos(frameCount * 0.40) * 10;

  tile(int(width / 1) + int(xOffset1), int(height / 3) + int(yOffset1));
  tile(int(width / 4) + int(xOffset2), int(height / 4) + int(yOffset2));
   tile(int(width / 8) + int(xOffset1), int(height / 5) + int(yOffset1));
  tile(int(width / 16) + int(xOffset2), int(height / 5) + int(yOffset2));
   tile(int(width / 30) + int(xOffset1), int(height / 6) + int(yOffset1));
  tile(int(width / 60) + int(xOffset2), int(height / 8) + int(yOffset2));
  tile(int(width / 90) + int(xOffset1), int(height / 2) + int(yOffset1));
  tile(int(width / 10) + int(xOffset2), int(height / 10) + int(yOffset2));
   tile(int(width / 10) + int(xOffset1), int(height / 2) + int(yOffset1));
 
}

void tile(int xpos, int ypos) {
  noFill();
  stroke(0, 0, 254);
  int step = 400;
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += radians(40)) {
    float x = xpos + cos(angle) * step;
    float y = ypos + sin(angle) * step;
    vertex(x, y);
    
    while (step<500)
  {

    circle(xpos, ypos, step);
    step=step + 5;
  }
  }
  endShape(CLOSE);
}
