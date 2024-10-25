//made by Thomas Wind

// Gebruik van ChatGPT: Uit vogelen waarom SVG's niet werkte in P2D en hoe ik dat moest oplossen.
// Gebruik van ChatGPT: Een opzetje voor hoe ik de achtergrond van kleur kon veranderen middels shape scaling.

float rectSize = 0;
boolean isOranje = false;
float angle = radians(45);

float rotation = 0;
float rotationMain = 0;
float amplitudeHorizontal = 265; //285 als waarde zonder P2D
float amplitudeVertical = 135; //170 als waarde zonder P2D
float speed = 0.05;

PShape wereld;
PImage gradientImage; //<>//

void setup() {
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

  //Triangle ACHTERGROND
  drawTriangles(0, 0);

  //6 Mini WERELDEN
  float countVerticalA = height / 2 + sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(width / 2 - 260, countVerticalA); //290 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  float countVerticalB = height / 2 - sin(frameCount * speed) * amplitudeVertical;
  pushMatrix();
  translate(width / 2 + 260, countVerticalB); //290 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  float countHorizontalA = width / 2 + sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(countHorizontalA, height / 2 - 135); //165 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  float countHorizontalB = width / 2 - sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(countHorizontalB, height / 2 + 135); //165 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  float countHorizontalC = width / 2 - sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(countHorizontalC, height / 2 - 135); //165 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  float countHorizontalD = width / 2 + sin(frameCount * speed) * amplitudeHorizontal;
  pushMatrix();
  translate(countHorizontalD, height / 2 + 135); //165 als waarde zonder P2D
  rotate(rotation);
  shapeMode(CENTER);
  drawTile();
  popMatrix();

  rotation += 0.120;

  //Main WERELD
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(rotationMain);
  translate(0, 0);
  drawTileMiddle();
  popMatrix();
  rotationMain += -0.01;
}

//DESIGN ELEMENTEN

//6 Mini WERELD Design
void drawTile() {
  wereld.disableStyle(); 
  shapeMode(CENTER);
  fill(254, 149, 119);
  stroke(1, 106, 136);
  strokeWeight(5);
  shape(wereld, 0, 0, 150, 150);
}

//Main WERELD Design
void drawTileMiddle() {
  image(gradientImage, -175, -175, 350, 350);
}

//Triangles Pattern DESIGN
int count = 0;

void drawTriangles(float xpos, float ypos) {
  int spacing = 80;

  // 1 Oranje rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(254, 149, 119);
    noStroke();
    triangle(
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 0,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 80,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 80
      );
  }

  //2 Blauwe rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(1, 106, 136);
    noStroke();
    triangle(
      xpos  + 80 + triDuplicate * (80 + spacing),
      ypos + 160,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 160,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 80
      );
  }

  // 3 Oranje rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(254, 149, 119);
    noStroke();
    triangle(
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 160,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 240,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 240
      );
  }

  //4 Blauwe rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(1, 106, 136);
    noStroke();
    triangle(
      xpos  + 80 + triDuplicate * (80 + spacing),
      ypos + 240,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 320,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 320
      );
  }

  // 5 Oranje rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(254, 149, 119);
    noStroke();
    triangle(
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 320,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 400,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 400
      );
  }

  //4 Blauwe rij
  for (int triDuplicate = 0; triDuplicate < 9; triDuplicate++) {
    fill(1, 106, 136);
    noStroke();
    triangle(
      xpos  + 80 + triDuplicate * (80 + spacing),
      ypos + 400,
      xpos + 0 + triDuplicate * (80 + spacing),
      ypos + 480,
      xpos + 80 + triDuplicate * (80 + spacing),
      ypos + 480
      );
  }
}
