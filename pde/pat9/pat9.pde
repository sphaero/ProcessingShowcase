//made by Mees Hofman
int width = 40;
int height = 40;
float size = 200;
float sizecir = 1000;
float sizecirc = 1200;
float rad = 25;
float dif = 0.6;
float small = 90;
int speed = 5;
int x = 50;
int y = 30;
int u=60;
int count = 0;




void setup() {
  size(720, 480);
  background(13);
}


void draw() {
  cir();
  cir();
  cir();
  cir();
  cir();
  cir();
  cir();
  vier();
  black();
  dvd();

  count = count + 1;
}



void dvd() {
  int size = 80;


  stroke(255, 219, 88);
  rect(0, 0, size, size);

  rad = rad +1;

  rect(x*6, y*6, size, size);
  rect(x*2, y*2, size, size);

  if (x > width - size/2 || x < size/2) {
    speed *= -1;
  }
}

void black() {
  int size = 80;
  int rad = 50;

  rad = rad - 1;

  fill(128, 128, 0,5);

  rect(x*4, y*4, size, size);
}

void vier() {


  int x = 360;
  int y = 240;

  noFill();
  strokeWeight(1);
  stroke(235, 215, 168); //beige

  translate(x, y);
  rotate(rad);
  rectMode(CENTER);
  rect(0, 0, size, size);

  rad = rad +1;


  size -= dif;
  pushMatrix();
  if (size < 22 || size > 220) {
    dif = -dif;
  }

  rotate(0);
  popMatrix();
}

void cir() {
  pushMatrix();
  int x = 360;
  int y = 240;
  float rad = 0;
  rotate(0);
  noFill();
  strokeWeight(1);
  stroke(255, 113, 52,4);

  circle(x, y, sizecir);
  sizecir = sizecir - small;

  if (sizecir <=4) {
    sizecir = 1000;
  }
  popMatrix();
}
