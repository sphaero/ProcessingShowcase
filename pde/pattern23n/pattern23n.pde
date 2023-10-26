int numParticles = 50;
Particle[] particles = new Particle[numParticles];
color[] moleculeColors = { #FFFFFF, #000000, #9B5DE5, #8FF75C };

void setup() {
  size(800, 600);
  frameRate(30);

  for (int i = 0; i < numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(0, 10); 

  for (int i = 0; i < numParticles; i++) {
    Particle p = particles[i];
    p.update();
    p.display();
  }
}

void mousePressed() {
  for (int i = 0; i < numParticles; i++) {
    particles[i].explode(mouseX, mouseY);
  }
}

class Particle {
  float x, y;
  float xSpeed, ySpeed;
  float size;
  color moleculeColor;
  boolean exploding = false;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.xSpeed = random(-1, 1);
    this.ySpeed = random(-1, 1);
    this.size = random(10, 30);
    this.moleculeColor = moleculeColors[int(random(moleculeColors.length))];
  }

  void update() {
    if (!exploding) {
      x += xSpeed;
      y += ySpeed;

      if (x < 0 || x > width) {
        xSpeed *= -1;
      }
      if (y < 0 || y > height) {
        ySpeed *= -1;
      }
    }
  }

  void display() {
    noStroke();
    fill(moleculeColor);
    ellipse(x, y, size, size);
  }

  void explode(float targetX, float targetY) {
    exploding = true;
    float angle = atan2(targetY - y, targetX - x);
    xSpeed = cos(angle) * random(5, 10);
    ySpeed = sin(angle) * random(5, 10);
  }
}
