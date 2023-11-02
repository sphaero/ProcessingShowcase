//animation demo 11 debie.l sketch

int backgroundColor;
int glitchColor;
int step = 0;
int lastChange = 0;
int beatInterval;
boolean glitching = false;

void setup() {
  size(720, 480);
  backgroundColor = color(0, 0, 0);
  glitchColor = color(0, 255, 0);
  beatInterval = round(60 / 128 * 1000);

}

void draw() {
  if (millis() - lastChange >= beatInterval) {
    if (glitching) {
      background(backgroundColor);
    } else {
      background(glitchColor);
    }
    
    glitching = !glitching;
    lastChange = millis();
  }
  
  if (glitching) {
    drawGlitch();
  }
}

void drawGlitch() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    if (random(1) < 0.1) {
      pixels[i] = color(255);
    }
  }
  updatePixels();
}
