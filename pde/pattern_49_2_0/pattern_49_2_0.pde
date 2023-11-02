int bpm = 127;  // BPM
float beatDuration;
float lastBeatTime;
float colorChangeSpeed = 0.2;
float ellipseSize = 100;

ArrayList<Ellipse> ellipses;

// Camera shake variables
float shakeIntensity = 0;
float shakeDuration = 0;
float shakeStart = 0;

void setup() {
  size(720, 480);
  beatDuration = 60000.0 / bpm;  // Calculate the duration of one beat in milliseconds
  lastBeatTime = millis();
  ellipses = new ArrayList<Ellipse>();
}

void draw() {
  // Calculate a varying shade of green based on the current beat time
  int greenShade = (int) map(millis() - lastBeatTime, 0, beatDuration, 0, 255);
  greenShade = (int) (greenShade * colorChangeSpeed);  // Apply the color change speed

  // Add camera shake effect
  if (shakeDuration > 0) {
    float shakeX = random(-shakeIntensity, shakeIntensity);
    float shakeY = random(-shakeIntensity, shakeIntensity);
    translate(shakeX, shakeY);
    shakeDuration -= millis() - shakeStart;
    shakeStart = millis();
  }

  background(10, greenShade, 0);

  // Check if it's time for a new beat
  if (millis() - lastBeatTime >= beatDuration) {
    // Trigger camera shake when a new ellipse appears
    triggerCameraShake(5, 200);  // Adjust intensity and duration as needed

    // Create a new ellipse and add it to the array
    float x = random(width);
    float y = random(height);
    Ellipse newEllipse = new Ellipse(x, y, ellipseSize);
    ellipses.add(newEllipse);

    // Update the last beat time
    lastBeatTime = millis();
  }

  // Display and update each ellipse
  for (int i = ellipses.size() - 1; i >= 0; i--) {
    Ellipse e = ellipses.get(i);
    e.display();
    e.update();

    // Remove ellipses that have exceeded their lifetime
    if (e.isFinished()) {
      ellipses.remove(i);
    }
  }
}

class Ellipse {
  float x, y;  // Position
  float size;  // Size
  float alpha;  // Transparency
  float lifespan;  // How long the ellipse stays visible

  Ellipse(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.alpha = 255;  // Fully opaque initially
    this.lifespan = 2000;  // Ellipse visibility duration in milliseconds (2 seconds)
  }

  void display() {
    noStroke();
    fill(0, alpha, 0, alpha);
    ellipse(x, y, size, size);
  }

  void update() {
    alpha -= 1;  // Reduce alpha (fade out effect)
  }

  boolean isFinished() {
    return alpha <= 0;  // Check if ellipse is fully faded out
  }
}

// Function to trigger camera shake
void triggerCameraShake(float intensity, float duration) {
  shakeIntensity = intensity;
  shakeDuration = duration;
  shakeStart = millis();
}
