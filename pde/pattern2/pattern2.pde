///safe as pattern2

void setup() {
  size(720, 480);
}

void draw() {
  if (frameCount % 30 < 1) {
    background(color(random(255), random(0)));
  }

  if (frameCount % 2 < 286) {
    vierkant(24);
  }
}

void vierkant(float amount) {
  float n = 0;
  while (n < amount + 1) {
    fill(color(random(0), random(0)));
    stroke(random(255), random(255), random(255)); // Willekeurige kleur voor de gloed
    strokeWeight(2); // Breedte van de gloedrand
    rect(random(720), random(480), 10, 10);
    n++;
  }
}
