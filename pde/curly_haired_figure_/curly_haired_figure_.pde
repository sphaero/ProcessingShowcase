void setup() {
  size(720, 480);
}

void draw() {
  background(220);
  
  // Draw skull with curly hair
  drawSkullWithCurlyHair(width/2, height/2);
}

void drawSkullWithCurlyHair(float x, float y) {
  // Draw skull
  drawSkull(x, y);
  
  // Draw curly hair
  drawCurlyHair(x, y);
}

void drawSkull(float x, float y) {
  // Head
  fill(255);
  ellipse(x, y, 200, 200);
  
  // Eyes
  fill(0);
  ellipse(x - 40, y - 40, 40, 40);
  ellipse(x + 40, y - 40, 40, 40);
  
  // Eye Sockets
  fill(255);
  ellipse(x - 40, y - 40, 20, 20);
  ellipse(x + 40, y - 40, 20, 20);
  
  // Nose
  fill(0);
  triangle(x - 20, y, x + 20, y, x, y + 30);
  
  // Teeth
  fill(255);
  rectMode(CENTER);
  rect(x - 40, y + 60, 30, 30);
  rect(x - 10, y + 60, 30, 30);
  rect(x + 20, y + 60, 30, 30);
  rect(x + 50, y + 60, 30, 30);
  
  // Jawline
  stroke(0);
  strokeWeight(10);
  line(x - 70, y + 90, x + 70, y + 90);
}

void drawCurlyHair(float x, float y) {
  // Set curly hair color
  fill(0);
  
  // Draw curly hair ellipses
  float hairRadius = 30;
  
  // Top row of curly hair
  ellipse(x, y - 100, hairRadius*2, hairRadius*2);
  ellipse(x - 40, y - 100, hairRadius*2, hairRadius*2);
  ellipse(x + 40, y - 100, hairRadius*2, hairRadius*2);
  
  // Middle row of curly hair
  ellipse(x - 70, y - 70, hairRadius*2, hairRadius*2);
  ellipse(x + 70, y - 70, hairRadius*2, hairRadius*2);
  
  // Bottom row of curly hair
  ellipse(x - 100, y - 40, hairRadius*2, hairRadius*2);
  ellipse(x + 100, y - 40, hairRadius*2, hairRadius*2);
}
