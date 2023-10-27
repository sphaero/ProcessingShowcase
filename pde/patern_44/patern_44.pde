// pattern 44 

int bpm = 127; // Beats per minute
float squareSize = 100; 
float squareX, squareY; 
boolean flash = false; 
int lastBeatMillis;
float flashDuration = 200; 
int xDirection = 1; 
int yDirection = 1; 

void setup() {
  size(720, 480);
  frameRate(60); // Set the frame rate to 60 FPS
  squareX = (width - squareSize) / 2; // Center the square horizontally
  squareY = (height - squareSize) / 2; // Center the square vertically
  
  lastBeatMillis = millis();
}

void draw() {
  background(flash ? 255 : 0); // White flash when the "flash" flag is true
  noStroke();
  fill(0); // Black square
  
  if (flash) {
    flash = false;
    lastBeatMillis = millis();
  }
  
  // Draw the square
  rect(squareX, squareY, squareSize, squareSize);
  
  // Update the square's position
  squareX += 2 * xDirection; // Horizontal movement speed
  squareY += 2 * yDirection; // Vertical movement speed
  
  // Check if the square reaches the screen edges and change direction
  if (squareX <= 0 || squareX >= width - squareSize) {
    xDirection *= -1;
  }
  if (squareY <= 0 || squareY >= height - squareSize) {
    yDirection *= -1;
  }
  
  // Check for a new beat based on time elapsed
  if (millis() - lastBeatMillis >= 60000.0 / bpm) {
    flash = true; // Trigger the white flash
  }
}
