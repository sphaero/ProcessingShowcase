float angle = 1; // Global variable to control animation
float angle2 = 1.5;

void setup() {
  size(720, 480);
}

void draw() {

  rectMode(CENTER);
  int randomValue = (int (random(4)));

  if (randomValue <= 1) {
    background(235, 215, 168);
  } else 
  {
    noFill();
    background(220, 210, 150);
    stroke(100);
  }

  //square green
  pushMatrix();
  float squareSize = (100 + sin(angle) * (int (random(50)))) / 1; // Vary the size of the square
  drawSquare(1, 0, squareSize, color(128, 128, 0), 1); 
  popMatrix();

/*
  //circle upper   
  pushMatrix();
  rectMode(CENTER);
  float circleX = width/2 + sin(angle) * 50; // Vary the x-coordinate of the circle
  float circleY = (height/2) * 1/4; 
  drawCircle(circleX, circleY, 100, color(255, 113, 52), 1); 
  popMatrix();

  //circle lower  
  pushMatrix();
  float circleX2 = width/2 + sin(angle * -1) * 50; 
  float circleY2 = (height/2) * 7/4;
  drawCircle(circleX2, circleY2, 100, color(255, 113, 52), 1); 
  popMatrix();
*/
/*
  //triangle left
  float triangleY = height/2 + sin(angle) * 50; 
  // Vary the y-coordinate of the triangle
  drawTriangle(width*3/4 - 50, triangleY + 50, width*3/4 + 50, triangleY + 50, width*3/4, triangleY - 50, color(255, 219, 88), (int (random(0.1, 50)))); // Blue triangle

  //triangle right
  float triangleY1 = height/2 + sin(angle) * -50; 
  // Vary the y-coordinate of the triangle
  drawTriangle(width*1/4 - 50, triangleY1 + 50, width*1/4 + 50, triangleY1 + 50, width*1/4, triangleY1 -50, color(255, 219, 88), (int (random(50)))); // Blue triangle
*/
  angle += 0.11;

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
  angle2+=2.5;
  popMatrix();
}

void drawTriangle(float x1, float y1, float x2, float y2, float x3, float y3, color fillColor, int strokeT) {
  fill(fillColor);
  stroke(10);
  strokeWeight(strokeT);
  triangle(x1, y1, x2, y2, x3, y3);
}
