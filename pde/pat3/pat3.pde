float angle = 1; // Global variable to control animation
float angle2 = 1.5;

void setup() {
  size(720, 480);
}

void draw() {

  //translate(width/2, height/2);
  rectMode(CENTER);
  //scale(0.5);
  //background(255);
  //noFill();
  int randomValue = (int (random(4)));

  if (randomValue <= 1) {
    background(255);
  } else 
  {
    noFill();
    background(155, 0);
    stroke(100);
  }

  pushMatrix();
  //translate(sin(0.15), sin(0.15));
  //rotate(PI/(0.1));
  //rectMode(CENTER);
  //rotate(radians(frameCount * 2));
  // Animate the square
  float squareSize = (100 + sin(angle) * (int (random(50)))) / 1; // Vary the size of the square
  drawSquare(10, 10, squareSize, color(128, 128, 0), 1); // Green square
  popMatrix();

  // Animate the circle
  pushMatrix();
  //rotate(radians(angle2*20));
  rectMode(CENTER);
  float circleX = width/2 + sin(angle) * 50; // Vary the x-coordinate of the circle
  float circleY = (height/2) * 1/4; // Keep the y-coordinate constant
  drawCircle(circleX, circleY, 100, color(255, 113, 52), 1); // Red circle
  popMatrix();

  // Animate the circle
  pushMatrix();
  //translate(width/2, height/2);
  //rectMode(CENTER);
  //scale(20);
  
  float circleX2 = width/2 + sin(angle * -1) * 50; // Vary the x-coordinate of the circle
  float circleY2 = (height/2) * 7/4;
  ; // Keep the y-coordinate constant
  drawCircle(circleX2, circleY2, 100, color(255, 113, 52), 1); // Red circle
  popMatrix();

  //background(55);


  // Animate the triangle
  float triangleY = height/2 + sin(angle) * 50; /*(int (random(0)));*/
  // Vary the y-coordinate of the triangle
  drawTriangle(width*3/4 - 50, triangleY + 50, width*3/4 + 50, triangleY + 50, width*3/4, triangleY - 50, color(255, 219, 88), (int (random(0.1, 50)))); // Blue triangle

  // Animate the triangle
  float triangleY1 = height/2 + sin(angle) * -50; /*(int (random(0)));*/
  // Vary the y-coordinate of the triangle
  drawTriangle(width*1/4 - 50, triangleY1 + 50, width*1/4 + 50, triangleY1 + 50, width*1/4, triangleY1 -50, color(255, 219, 88), (int (random(50)))); // Blue triangle

  angle += 0.15;//(random(0.001, 0.85)); // Increment the angle for the next frame
}


void drawCircle(float x, float y, float diameter, color fillColor, int strokeC) {
  fill(fillColor);
  stroke(10);
  strokeWeight(strokeC);
  ellipse(x, y, diameter, diameter);
}

void drawSquare(float x, float y, float sideLength, color fillColor, int strokeS) {
  fill(fillColor);
  stroke(10);
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(strokeS);
  rectMode(CENTER);
  rotate(radians(angle2*3));

  rect(x, y, sideLength, sideLength);
  angle2+=0.5;
  popMatrix();
}

void drawTriangle(float x1, float y1, float x2, float y2, float x3, float y3, color fillColor, int strokeT) {
  fill(fillColor);
  stroke(10);
  strokeWeight(strokeT);
  triangle(x1, y1, x2, y2, x3, y3);
}
