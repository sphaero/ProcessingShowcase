// Set up canvas
void setup() {
  size(720, 480);
}

// Static background color
//void drawBackground() {
 // background(255, 219, 88);
//}

// Moving pattern
void drawPattern() {
  int patternSize = 75; // Size of each pattern element
  int patternSpacing = 100; // Spacing between pattern elements
  int patternSpeed = 2; // Speed of pattern movement
  color patternColor = color(255, 219, 88); // Color of pattern elements

  for (int x = -patternSpacing; x < width + patternSpacing; x += patternSpacing) {
    for (int y = -patternSpacing; y < height + patternSpacing; y += patternSpacing) {
      int offsetX = (x + frameCount * patternSpeed) % (width + patternSpacing);
      int offsetY = (y + frameCount * patternSpeed) % (height + patternSpacing);
      float rotation = sin(frameCount * 0.05) * PI;

      pushMatrix();
      translate(offsetX, offsetY);
      rotate(rotation);
      fill(patternColor);
      rect(0, 0, patternSize, patternSize);
      popMatrix();
    }
  }
}

// Main draw loop
void draw() {
 // drawBackground();
  drawPattern();
}
