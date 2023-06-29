ArrayList<Rocket> rockets; // List to store the rockets
ArrayList<Explosion> explosions; // List to store the explosions
float offset; // Offset for the animation

void setup() {
  size(800, 600);
  rockets = new ArrayList<Rocket>();
  explosions = new ArrayList<Explosion>();

  // Create five rockets
  rockets.add(new Rocket(width * 0.2, height, 30, 60));
  rockets.add(new Rocket(width * 0.4, height, 40, 80));
  rockets.add(new Rocket(width * 0.6, height, 50, 100));
  rockets.add(new Rocket(width * 0.8, height, 40, 80));
  rockets.add(new Rocket(width, height, 30, 60));

  offset = 0;
}

void draw() {
  // Clear the frame
  background(0);

  // Draw the explosions
  for (int i = explosions.size() - 1; i >= 0; i--) {
    Explosion explosion = explosions.get(i);
    explosion.update();
    explosion.display();
    if (explosion.finished()) {
      explosions.remove(i);
    }
  }

  // Draw the rockets
  for (Rocket rocket : rockets) {
    rocket.update();
    rocket.display();

    // Check for collision with rockets and create explosions
    if (rocket.checkCollision()) {
      Explosion explosion = new Explosion(rocket.x, rocket.y + rocket.h * 0.5, 80);
      explosions.add(explosion);
    }
  }

  // Update the offset for animation
  offset += 0.02;
}

class Rocket {
  float x, y;   // Position
  float w, h;   // Width and height
  float speed;  // Falling speed

  Rocket(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = random(2, 4); // Randomize falling speed
  }

  void update() {
    // Move the rocket upwards
    y -= speed;

    // If the rocket goes off-screen, reset its position
    if (y < -h) {
      y = height + random(100, 400);
    }
  }

  void display() {
    // Set the rocket colors
    color bodyColor = color(128, 128, 0);    // Groen
    color windowColor = color(255, 113, 52); // Oranje
    color boosterColor = color(235, 215, 168);  // Beige

    // Draw the rocket body
    fill(bodyColor);
    rect(x - w / 2, y, w, h);

    // Draw the organ color in the center
    fill(255, 0, 0);  // Red
    rect(x - w * 0.15, y + h * 0.1, w * 0.3, h * 0.4);

    // Calculate the booster positions
    float boosterWidth = w * 0.15;
    float boosterHeight = h * 0.3;
    float leftBoosterX = x - w / 2 - boosterWidth;
    float rightBoosterX = x + w / 2;
    float boosterY = y + h * 0.15;

    // Draw the beige boosters on the sides
    fill(boosterColor);
    rect(leftBoosterX, boosterY, boosterWidth, boosterHeight);
    rect(rightBoosterX, boosterY, boosterWidth, boosterHeight);

    // Draw the larger curvature on the top
    fill(windowColor);
    arc(x, y, w * 0.8, h * 0.5, PI, TWO_PI, CHORD);
  }

  boolean checkCollision() {
    // Check if the rocket is in the bottom part of the frame
    if (y + h > height * 0.8) {
      return true;
    }
    return false;
  }
}

class Explosion {
  float x, y;      // Position
  float size;      // Size of the explosion
  float maxSize;   // Maximum size of the explosion

  Explosion(float x, float y, float maxSize) {
    this.x = x;
    this.y = y;
    this.size = 0;
    this.maxSize = maxSize;
  }

  void update() {
    // Increase the size of the explosion
    size += 2;
  }

  void display() {
    // Set the explosion color
    color explosionColor = color(255, 113, 52);  // Oranje

    // Draw the explosion as a growing circle
    noStroke();
    fill(explosionColor);
    ellipse(x, y, size, size);
  }

  boolean finished() {
    // Check if the explosion has reached its maximum size
    if (size >= maxSize) {
      return true;
    }
    return false;
  }
}
