ArrayList<Triangle> triangles = new ArrayList<Triangle>();
color[] colors = { #FFFFFF, #9B5DE5, #8FF75C };

void setup() {
  size(720, 480);
  background(0);
  noFill();
  frameRate(60);
}

void draw() {
  if (frameCount % 5 == 0) {
    color c = colors[int(random(colors.length))]; // Convert random value to integer
    Triangle t = new Triangle(width / 2, height / 2, c);
    triangles.add(t);
  }
  
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = triangles.get(i);
    t.move();
    t.display();
    
    if (t.isOutOfBounds()) {
      triangles.remove(i);
      i--;
    }
  }
}

class Triangle {
  float x, y;
  float xSpeed, ySpeed;
  color triangleColor;

  Triangle(float x, float y, color c) {
    this.x = x;
    this.y = y;
    float angle = random(TWO_PI); // Random direction
    float speed = random(2, 5); // Random speed
    this.xSpeed = cos(angle) * speed;
    this.ySpeed = sin(angle) * speed;
    this.triangleColor = c;
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  void display() {
    stroke(triangleColor);
    triangle(x, y, x - 10, y + 30, x + 10, y + 30);
  }

  boolean isOutOfBounds() {
    return y > height;
  }
}
