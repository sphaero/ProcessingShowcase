float x1 = 260;
float dif = 7;
float sizecir = 1000;
float small = 90;
int c = color(180, 80, 40);
int c2 = color(240, 230, 140);
int c3 = color(180, 80, 40);
int kleuractief = 0;
int Co = color(128, 128, 0);
int Co2 = color(235, 215, 168);
float scaleVal=1;
float scaleIncrement=1.2;
float scaleMax = 5.0;

void setup() {
  size(720, 480);
  background(13);
}


void draw() {
  tri4();
  tri();
  tri2();
  cir();
}


void tri4() {
  scaleVal = scaleVal + scaleIncrement;
  push();
  translate(width/2, height/2);
  scale(scaleVal);
  float tx1 = -5;
  float ty1 = 5;
  float tx2 = 0;
  float ty2 = -5;
  float tx3 = 5;
  float ty3 = 5;


  noFill();
  strokeWeight(1);
  stroke(Co);
  triangle(tx1, ty1, tx2, ty2, tx3, ty3);

  if (scaleVal >= 160) {
    scaleVal = 1;
    kleuractief = kleuractief + 1;

    if (kleuractief >=2) {
      kleuractief = 0;
    }
  }

  if (kleuractief == 0) {
    Co = Co2;
  } else {
    Co = color(128, 128, 0);
  }



  pop();
}


void tri() {


  noFill();
  strokeWeight(3);
  stroke(c);
  triangle(x1, 310, 360, 140, 460, 310);

  x1 = x1 + dif;


  if (x1 >= 460) {
    dif = -dif;
    c = c2;
  }

  if (x1 <= 259) {
    dif = -dif;
    c = c3;
  }
}



void tri2() {
  float x1 = 260;
  float y1 = 140;
  float x2 = 360;
  float y2 = 310;
  float x3 = 460;
  float y3 = 140;

  noFill();
  strokeWeight(3);
  stroke(c, 20);
  triangle(x1, y1, x2, y2, x3, y3);
}

void cir() {
  pushMatrix();
  int x = 360;
  int y = 240;
  float rad = 0;
  rotate(0);
  noFill();
  strokeWeight(1);
  stroke(240, 230, 140, 60);

  circle(x, y, sizecir);
  sizecir = sizecir - small;

  if (sizecir <=4) {
    sizecir = 1000;
  }
  popMatrix();
}
