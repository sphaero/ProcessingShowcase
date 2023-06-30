float angleLines = 0;
float speedLines = 0.07;

void setup() {
  size(720, 480);
  background(0);
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(angleLines);
  
  // Draw moving curves with randomized colors
  for (float y = -height/2; y < height/2; y += 30) {
    float x1 = sin(angleLines) * y;
    float x2 = cos(angleLines) * y;
    
    // Generate a random index to choose a color
    int colorIndex = int(random(3));
    
    // Assign colors based on the random index
    if (colorIndex == 0) {
      stroke(128, 128, 0); // Yellowish color
    } else if (colorIndex == 1) {
      stroke(255, 113, 52); // Orange color
    } else {
      stroke(255, 219, 88); // Light yellow color
    }
    
    // Generate a random thickness value between 1 and 5
    float thickness = random(1, 10);
    strokeWeight(thickness);
    
    curve(x1, y, 0, x1, y, x2, 0, y);
  }
  
  // Draw second set of rotating curves with randomized colors
  rotate(HALF_PI);
  for (float y = -height/2; y < height/2; y += 30) {
    float x1 = sin(angleLines) * y;
    float x2 = cos(angleLines) * y;
    
    // Generate a random index to choose a color
    int colorIndex = int(random(3));
    
    // Assign colors based on the random index
    if (colorIndex == 0) {
      stroke(128, 128, 0); // Yellowish color
    } else if (colorIndex == 1) {
      stroke(255, 113, 52); // Orange color
    } else {
      stroke(255, 219, 88); // Light yellow color
    }
    
    curve(x1, y, 0, x1, y, x2, 0, y);
  }
  
  angleLines += speedLines;
}
