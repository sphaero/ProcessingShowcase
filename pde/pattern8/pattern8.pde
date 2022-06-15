float t;

static final int thisthing = 150;

void setup() {
  background(0);
  size(720,480);
}

void draw(){
  background(0);
  stroke(0,205,120);
  strokeWeight(3);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < thisthing; i++) {
  
line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));

  }

  t+= 0.04;
}

float x1(float t) {
  return sin(t/20)*800 + sin(t/10)*30;
  
}

float y1(float t) {
  return cos(t/20)*700;
  
}

float x2(float t) {
  return sin(t/10)*400 + sin(t)*300;
  
}

float y2(float t) {
  return cos(t/2)*40 + cos(t/4)*150;
  
}
