float rectSize = 0;
boolean isOranje = false;
float angle = radians(45);

float rotation = 0;
float amplitudeVertical = 250;
float amplitudeHorizontal = 150;
float speed = 0.08;

PShape wereld;
PImage gradientImage; 

void setup() { //<>//
  size(720, 480, P2D);
  wereld = loadShape("Wereld.svg");
  gradientImage = loadImage("Wereld.png");  
  
}

void draw() {
  noStroke();

  if (isOranje) {
    background(254, 149, 119);
    fill(1, 106, 136);
  } else {
    background(1, 106, 136);
    fill(254, 149, 119);
  }

  translate(width / 2, height / 2);
  rotate(angle);

  rectMode(CENTER);
  rect(0, 0, rectSize, rectSize);

  rectSize += 60;
  if (rectSize > width * 1.5) {
    rectSize = 0;
    isOranje = !isOranje;
  }

  resetMatrix();
  
  drawTriangles(0, 0);

  float countHorizontalA = height / 2 + sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(width / 2 - 240, countHorizontalA); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();
  
  float countHorizontalB = height / 2 - sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(width / 2 + 240, countHorizontalB); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();

  float countVerticalA = width / 2 + sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(countVerticalA, height / 2 - 150); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();

  float countVerticalB = width / 2 - sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(countVerticalB, height / 2 + 150); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();
  
  float countVerticalC = width / 2 - sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(countVerticalC, height / 2 - 150); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();
  
  float countVerticalD = width / 2 + sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(countVerticalD, height / 2 + 150); 
  rotate(rotation);
  rectMode(CENTER);
  drawTile();
  popMatrix();
  
  rotation += 0.120;
  
}


void drawTile() {
  image(gradientImage, -75, -75, 150, 150);  
}

void drawTriangles(float xpos, float ypos) { 
  for (int triDuplicate = 0; triDuplicate < 30; triDuplicate++ ) {
    fill(254, 149, 119);
    noStroke();
    triangle(xpos  + 0 + triDuplicate * 45, ypos + 0, xpos + 0 + triDuplicate * 45, ypos + 45, xpos + 45 + triDuplicate * 45, ypos + 45);
  }
   for (int triDuplicate = 0; triDuplicate <30; triDuplicate++ ) {
    fill(1, 106, 136);
    noStroke();
    triangle(xpos  + 45 + triDuplicate * 45, ypos + 90, xpos + 0 + triDuplicate * 45, ypos + 90, xpos + 45 + triDuplicate * 45, ypos + 45);
  }
   for (int triDuplicate = 0; triDuplicate <30; triDuplicate++ ) {
    fill(254, 149, 119);
    noStroke();
    triangle(xpos  + 45 + triDuplicate * 45, ypos + 390, xpos + 0 + triDuplicate * 45, ypos + 435, xpos + 45 + triDuplicate * 45, ypos + 435);
  }
  for (int triDuplicate = 0; triDuplicate < 30; triDuplicate++ ) {
    fill(1, 106, 136);
    noStroke();
    triangle(xpos  + 0 + triDuplicate * 45, ypos + 480, xpos + 0 + triDuplicate * 45, ypos + 435, xpos + 45 + triDuplicate * 45, ypos + 480);
  }
}
