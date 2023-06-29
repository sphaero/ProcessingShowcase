int numShapes = 10; // Number of shapes to draw
float[] centerX = new float[numShapes]; // X position of shape centers
float[] centerY = new float[numShapes]; // Y position of shape centers
float[] rotationSpeed = new float[numShapes]; // Rotation speed of shapes
float[] angle = new float[numShapes]; // Current angle of shapes
float[] shapeSize = new float[numShapes]; // Size of shapes
float shapeRadius; // Radius of the central shape

void setup() {
  size(600, 600); // Set the size of the window
  background(0); // Set the background color
  
  shapeRadius = width * 0.2; // Set the radius of the central shape
  
  // Initialize the shape properties randomly
  for (int i = 0; i < numShapes; i++) {
    centerX[i] = random(width);
    centerY[i] = random(height);
    rotationSpeed[i] = random(-0.2, 0.02);
    shapeSize[i] = random(20, 100);
  }
}

void draw() {
  background(0); // Clear the background
  
  // Draw the central shape
  fill(255, 50);
  noStroke();
  ellipse(width/2, height/2, shapeRadius * 2, shapeRadius * 2);
  
  // Draw the rotating shapes around the central shape
  for (int i = 0; i < numShapes; i++) {
    // Calculate the position of the shape based on the angle
    float x = centerX[i] + cos(angle[i]) * shapeRadius;
    float y = centerY[i] + sin(angle[i]) * shapeRadius;
    
    // Draw the shape at the calculated position
    pushMatrix();
    translate(x, y);
    rotate(angle[i]);
    fill(255, 200);
    stroke(255);
    rectMode(CENTER);
    rect(0, 0, shapeSize[i], shapeSize[i]);
    popMatrix();
    
    // Update the angle based on the rotation speed
    angle[i] += rotationSpeed[i];
  }
}
