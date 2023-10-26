int x1, y1, x2, y2;  // Coordinates of two feet
int bpm = 128;      // Beats per minute
int delay = 60000 / bpm; // Delay in milliseconds

void setup() {
  size(720, 480);
  x1 = width / 8;
  y1 = height / 5;
  x2 = 3 * width / 7;
  y2 = height / 11;
  
  frameRate(100);  // Set the frame rate to 60 frames per second
}

void draw() {
  background(#9B5DE5);
  moveFeet();
  drawFeet();
}

void moveFeet() {
  x1 = (x1 + 120) % width;
  x2 = (x2 + 120) % width;
  delay(delay);
}

void drawFeet() {
  fill(#8FF75C);
  rect(x1, y1, 100, 130); // Left foot
  rect(x2, y2, 100, 300); // Right foot
}
