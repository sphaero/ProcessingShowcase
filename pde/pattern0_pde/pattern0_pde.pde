int numCircles = 1;  // Number of circles
color[] circleColors; // Array to store circle colors

void setup() {
  size(720, 480);
  background(0);
  circleColors = new color[] { #800080, #008000, #FFFFFF }; // Purple, Green, White
}

void draw() {
  for (int i = 0; i < numCircles; i++) {
    float x = random(width);
    float y = random(height);
    int colorIndex = int(random(circleColors.length));
    fill(circleColors[colorIndex]);
    noStroke();
    ellipse(x, y, 50, 50);
  }
}

void mousePressed() {
  numCircles++;  // Add a new circle on mouse click
}
