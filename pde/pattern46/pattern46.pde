void setup() {
  size(720, 480);
}

void draw() {
  if (frameCount % 25 < 10) {
    background(254, 254, 254);
  } else {
    background(0);
    textSize(20);
text("BOB_THE-BUILDER", 220, 400);
fill(143,247,92);
  }
  
  float xOffset1 = sin(frameCount * 0.1) * 100;
  float xOffset2 = sin(frameCount * 0.15) * 100;
  
  float yOffset1 = cos(frameCount * 0.1) * 50;
  float yOffset2 = cos(frameCount * 0.15) * 50;

  translate(width / 2, height / 2); 
  rotate(radians(frameCount * 0.08));  // Use 'rotate' instead of 'rotateY'

  // Draw multiple tiles aligned to the center
  for (int i = 0; i < 8; i++) {
    float xPos = cos(TWO_PI / 8 * i) * 100;
    float yPos = sin(TWO_PI / 8 * i) * 100;
    drawTile(xPos + xOffset1, yPos + yOffset1);
  }
  
  for (int i = 0; i < 8; i++) {
    float xPos = cos(TWO_PI / 8 * i) * 100;
    float yPos = sin(TWO_PI / 8 * i) * 100;
    drawTile(xPos + xOffset2, yPos + yOffset2);
  }
}

void drawTile(float xOffset, float yOffset) {
  noFill();
  stroke(155, 93, 229);
  int step = 10;
  beginShape(QUAD_STRIP); 
  
  for (float angle = 0; angle < TWO_PI; angle += radians(5)) {
    float x1 = cos(angle) * (step + xOffset);
    float y1 = sin(angle) * (step + yOffset);
    float x2 = cos(angle) * (step + xOffset);
    float y2 = sin(angle) * (step + yOffset + 20); 
    
    vertex(x1, y1); 
    vertex(x2, y2); 
  }
  
  endShape();
}
