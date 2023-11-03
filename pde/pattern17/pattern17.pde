void setup() {
  size(720, 480);
  background(0); // Set background color to black
  frameRate(30); // Set frame rate for smoother animation
}

void draw() {
  background(0); // Refresh the background to black
  
  // Draw the TV frame
  stroke(155, 93, 229); // Purple outline for TV frame
  strokeWeight(20);
  noFill();
  rect(50, 50, 620, 380); // Square TV frame
  
  // Draw the radar screen
  pushMatrix();
  translate(width/2, height/2); // Translate to the center of the TV frame
  fill(0); // Black color for radar background
  ellipse(0, 0, 640, 400); // Draw radar background
  
  // Draw rotating radar lines
  stroke(143, 247, 92); // Green color for radar lines
  strokeWeight(2);
  float angleStep = radians(10); // Angle step for radar lines
  for (float angle = 0; angle < TWO_PI; angle += angleStep) {
    float lineLength = random(150, 200); // Vary line length for a more dynamic look
    line(0, 0, lineLength * cos(angle), lineLength * sin(angle));
  }
  
  popMatrix();
}
