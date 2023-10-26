void setup() {
  size(720, 480);
  background(0);
}

int gridSize = 40;
float breathing = 0.0; // Variabele om de ademhaling te regelen
float angle = 0.0; // Variabele om de hoek te regelen

void draw() {
  breathing = sin(angle) * 5.0; // Sinusfunctie voor het ademhalingseffect
  angle += 0.02; // Verhoog de hoekwaarde om de ademhaling door te laten gaan
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(255);
      rect(x - 1, y - 1, 3, 3);
      stroke(255, 100);
      float lineSize = dist(x, y, width / 2, height / 2) + breathing; // Pas de lengte van de lijn aan
      float lineAngle = atan2(height / 2 - y, width / 2 - x);
      float x2 = x + cos(lineAngle) * lineSize;
      float y2 = y + sin(lineAngle) * lineSize;

      float jitterX = random(-5, 5); // Voeg willekeurige schok toe aan de X-positie
      float jitterY = random(-5, 5); // Voeg willekeurige schok toe aan de Y-positie
      line(x + jitterX, y + jitterY, x2 + jitterX, y2 + jitterY); // Voeg schokken toe aan de lijn
    }
  }
}
