Square[] squares;
int numSquares = 130;
int countdown = 180; // Set countdown duration in frames (3 seconds at 60 frames per second)
int countdownStartFrame; // Frame when the countdown started
boolean countingDown = true;

void setup() {
  size(720, 480);
  squares = new Square[numSquares];
  noFill();
  countdownStartFrame = frameCount;
  textSize(264); // Set text size once in setup
  textAlign(CENTER, CENTER); // Center text
}

void draw() {
  background(0);

  if (countingDown) {
    int framesElapsed = frameCount - countdownStartFrame;
    int framesLeft = countdown - framesElapsed;

    if (framesLeft > 0) {
      fill(255);
      text(int(framesLeft / 60) + 1, width / 2, height / 2); // Convert frames to a countdown (1, 2, 3)
    } else {
      countingDown = false;
      startExplosion();
    }
  } else {
    for (int i = 0; i < numSquares; i++) {
      if (squares[i] != null) {
        squares[i].move();
        squares[i].display();
      }
    }
  }
}

void startExplosion() {
  for (int i = 0; i < numSquares; i++) {
    float angle = random(TWO_PI); // Random direction
    float speed = random(5, 10); // Random speed
    color[] colors = {#FFFFFF, #9B5DE5, #8FF75C};
    color c = colors[int(random(colors.length))]; // Random color from the provided list
    squares[i] = new Square(width / 2, height / 2, cos(angle) * speed, sin(angle) * speed, c);
  }
}

class Square {
  float x, y;
  float xSpeed, ySpeed;
  float side = 20;
  color squareColor;

  Square(float x, float y, float xSpeed, float ySpeed, color c) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.squareColor = c;
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  void display() {
    fill(squareColor);
    rect(x, y, side, side);
  }
}
