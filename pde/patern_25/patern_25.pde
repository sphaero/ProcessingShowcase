// pattern 25
int bpm = 127; // 
float crossLength = 100; // Length of the cross
float crossWidth = 10; // Width of the cross
float angle = 0; // Initial angle of rotation
boolean fallingApart = false; // Flag for falling apart
int lastBeatMillis;
float crossSeparation = 5; // Separation between pieces

void setup() {
  size(720, 480);

  lastBeatMillis = millis();
}

void draw() {
  background(0); // Black background
  translate(width / 2, height / 2);
  rotate(radians(angle));
  stroke(255); // White color
  strokeWeight(2);

  if (fallingApart) {
    // Generate falling apart effect
    for (int i = -3; i <= 3; i++) {
      float offset = i * crossSeparation;
      line(offset, -crossLength, offset, crossLength);
    }
  } else {
    // Draw the spinning cross
    line(0, -crossLength, 0, crossLength);
    line(-crossLength, 0, crossLength, 0);
  }

  // Update the angle of rotation
  angle += 5; // Adjust rotation speed

  // Check for a new beat based on time elapsed
  if (millis() - lastBeatMillis >= 60000.0 / bpm) {
    fallingApart = !fallingApart; // Toggle falling apart
    lastBeatMillis = millis();
  }
}
