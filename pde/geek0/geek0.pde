void setup() {
  size(720, 480);
  background(255);  // Set the background color to white
}

void draw() {
  fill(100, 150, 200);  // Set fill color (in this case, a shade of blue)
  stroke(0);  // Set the stroke color to black
  strokeWeight(2);


  
  // Draw a pattern of rectangles
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 3; j++) {
      int x = i * 150;  // Calculate x-coordinate
      int y = j * 150;  // Calculate y-coordinate
      
      if ((i + j) % 2 == 0) {
        fill(100, 150, 200);  // Set fill color for even cells
      } else {
        fill(200, 100, 150);  // Set fill color for odd cells
      }
      
      rect(x, y, 100, 100);  // Draw a rectangle
    }
  }
}
