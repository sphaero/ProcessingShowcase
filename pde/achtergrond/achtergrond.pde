float offset; // Offset for the animation

void setup() {
  size(800, 600);
  offset = 0;
}

void draw() {
  background(0);

  // Draw the background gradient
  drawBackground();

  // Draw abstract lines
  drawLines();

  // Update the offset for animation
  offset += 0.02;
}

void drawBackground() {
  // Define the colors
  color color1 = color(128, 80, 0);     // #805000
  color color2 = color(255, 80, 0);     // #FF5000
  color color3 = color(255, 200, 80);   // #FFC850
  color color4 = color(235, 215, 168);  // #EBD7A8

  // Draw the gradient background
  for (int i = 0; i < height; i++) {
    // Calculate the color for each row
    float colorValue = map(i, 0, height, 0, 1);
    color c = lerpColor(color1, color4, colorValue);

    // Set the fill color and draw a rectangle for each row
    fill(c);
    rect(0, i, width, 1);
  }

  // Draw a gold band in the middle
  fill(color3);
  rect(0, height / 2 - 5, width, 10);
}

void drawLines() {
  // Define the colors
  color color1 = color(128, 80, 0);     // #805000
  color color2 = color(255, 80, 0);     // #FF5000
  color color3 = color(255, 200, 80);   // #FFC850
  color color4 = color(235, 215, 168);  // #EBD7A8

  // Set the stroke weight
  strokeWeight(2);

  // Loop through the width of the canvas
  for (float x = 0; x < width; x += 10) {
    // Calculate the y-coordinate based on the sine function and the offset
    float y = height / 2 + sin(x * 0.01 + offset) * 100;

    // Set the stroke color based on the y-coordinate
    float colorValue = map(y, height / 2 - 100, height / 2 + 100, 0, 1);
    color c = lerpColor(color1, color2, colorValue);
    stroke(c);

    // Draw a line from the top to the y-coordinate
    line(x, 0, x, y);
  }
}
