
int barWidth = 20;
int lastBar = -1;
float startTime;
float bpm = 256;

void setup() {
  size(720, 480);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(0);
  startTime = millis();
}

void draw() {
  float elapsedTime = millis() - startTime;
  float beatsPerMillis = bpm / 60000.0;
  float timeInBeats = elapsedTime * beatsPerMillis;
  int whichBar = int(timeInBeats) % (width / barWidth);
  
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    float hue = map(barX, 0, width, 0, 60); // Roodtinten
    float saturation = 100;
    float brightness = map(sin(timeInBeats * TWO_PI), -1, 1, 0, 100);
    fill(hue, saturation, brightness);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }

  // Voeg willekeurige zwarte vlekken toe
  for (int i = 0; i < 5; i++) { // Voeg 5 zwarte vlekken toe per frame (pas dit aantal naar wens aan)
    int x = int(random(width));
    int y = int(random(height));
    int size = int(random(5, 30)); // Pas de grootte van de vlekken naar wens aan
    fill(0); // Zwart
    rect(x, y, size, size);
  }
}
