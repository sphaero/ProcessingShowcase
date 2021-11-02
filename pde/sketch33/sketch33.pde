int num =30;
float step;
float snelheid;
float hoek;
float offSet;
float loop;


void setup() {
  size(600, 400);
  strokeWeight(5);
  step = 30;
}

void draw() {
  background(0);
  translate(width/2, height);
  hoek = 0;
  for (int i=0; i<num; i++) {
    stroke(255);
    noFill();
    loop = i*step;
    float offSet = PI/num*i;
    float arcEnd = map(sin(snelheid+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, loop, loop, PI, arcEnd);
  }
  snelheid += .012;
  
}
