float t;
PImage img;
PImage img2;

static final int thisthing = 10;

void setup() {
  background(0,205,102);
  size(720,480);
  img = loadImage("vogel.png");
    img = loadImage("vogel2.png");
}

void draw(){
   background(0,205,102);
  stroke(255);
  strokeWeight(4);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < thisthing; i++) {
  
line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));


  }

  t+= 0.2;
}

float x1(float t) {
  return sin(t/200)*800 + sin(t/100)*300;
  
}

float y1(float t) {
  return cos(t/200)*700;
  
}

float x2(float t) {
  return sin(t/10)*400 + sin(t)*30;
  
}

float y2(float t) {
  return cos(t/20)*400 + cos(t/4)*150;
  
}
