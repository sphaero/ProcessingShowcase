int xafstand = 1;
int maxgolven = 25;
float snelheidsFactor = 0.1;

float theta = 0.0;
float[] amplitude = new float[maxgolven];
float[] dx = new float[maxgolven];
float[] ywaarden;

float spiralenSnelheid = 5;
color spiralenKleur;
float spiralenRotatie = 4;
float stipGrootte = 10;

boolean wisselKleur = false;

void setup() {
  size(720, 480);
  colorMode(RGB, 255, 255, 255, 100);
  int golfBreedte = width + 16;

  for (int i = 0; i < maxgolven; i++) {
    amplitude[i] = random(10, 30);
    float periode = random(100, 300);
    dx[i] = (TWO_PI / periode) * xafstand;
  }

  ywaarden = new float[golfBreedte / xafstand];
  
  spiralenKleur = color(0, 200, 255);
}

void draw() {
  background(0, 0, 0);
  translate(width / 2, height / 2);
  tekenSpiraal(spiralenRotatie);
  translate(-width / 2, -height / 2);
  berekenGolf();
  toonGolf();
  snelheidsFactor += 0.5;
  snelheidsFactor = min(10.0, snelheidsFactor);
  spiralenRotatie += spiralenSnelheid;
}

void berekenGolf() {
  theta += 0.02 * snelheidsFactor;
  for (int i = 0; i < ywaarden.length; i++) {
    ywaarden[i] = 0;
  }
  for (int j = 0; j < maxgolven; j++) {
    float x = theta;
    for (int i = 0; i < ywaarden.length; i++) {
      if (j % 2 == 0)
        ywaarden[i] += sin(x) * amplitude[j];
      else
        ywaarden[i] += cos(x) * amplitude[j];
      x += dx[j];
    }
  }
}

void toonGolf() {
  noStroke();
  fill(155, 93, 229);
  ellipseMode(CENTER);
  for (int x = 0; x < ywaarden.length; x++) {
    ellipse(x * xafstand, height / 2 + ywaarden[x], 8, 8);
  }
}

void tekenSpiraal(float rotatie) {
  float straal = 200;
  float hoekIncrement = 0.5;
  for (float t = 0; t < 20000; t += hoekIncrement) {
    float x = cos(t + rotatie) * (straal + t);
    float y = sin(t + rotatie) * (straal + t);
    
    if (wisselKleur) {
      fill(143, 247, 92);
    } else {
      fill(255, 255, 255);
    }
    ellipse(x, y, stipGrootte, stipGrootte);
    
    wisselKleur = !wisselKleur;
  }
}
