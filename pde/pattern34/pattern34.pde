color[] colors = { #FFFFFF, #000000, #9B5DE5, #8FF75C }; // Define an array of colors
int colorIndex = 0; // Initialize color index

void setup() {
  size(720, 480); 
  background(0);  
}

void draw() {
  translate(width/2, height/2); // Translate origin to center

  int numShapes = 20; // Number of shapes
  float angleIncrement = TWO_PI / numShapes * 2; // Increase rotation speed by multiplying angle increment
  float scaleIncrement = map(sin(frameCount * 0.1), -1, 1, 0.01, 0.03); // Increase scaling speed

  for (int i = 0; i < numShapes; i++) {
    pushMatrix(); // Save the current transformation
    rotate(i * angleIncrement); // Rotate each shape
    scale(map(sin(frameCount * scaleIncrement), -1, 1, 0.5, 1.5)); // Scale the shapes based on a faster sine wave
    drawShape(); // Draw the shape
    popMatrix(); // Restore the previous transformation
  }
}

void drawShape() {
  int nextColorIndex = (colorIndex + 1) % colors.length; // Get the index of the next color
  int fillColor = lerpColor(colors[colorIndex], colors[nextColorIndex], map(sin(frameCount * 0.1), -1, 1, 0, 1)); // Blend colors
  noStroke(); // Remove outline
  fill(fillColor);
  rect(0, 0, 200, 200); // Draw a square (adjusted size)

  colorIndex = (colorIndex + 1) % colors.length; // Cycle through colors
}
