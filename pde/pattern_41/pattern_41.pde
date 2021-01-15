import procmod.*;

ModPlayer plr;

int introSamplePlayed = 0;
int chorusSamplePlayed = 0;
float intromult = 0.1;

color circleFillCol = color(42,247,2);
color circleBorderCol = color(22,129,1);
color noiseCol = color(3,255,243);

PFont fnt;

void setup() {
  size(720, 480);
  frameRate(30);
  }
  
  void draw() {
  background(0);
  strokeWeight(1);
  
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, 1, height);
  }
  
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(1, 0, i, height);
  }
  
  fill(150,50,200);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 10.);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  fill(100,50,200);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 10.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  fill(150,50,150);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 10.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  
  
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void modRowEvent(int chan, int instr, int note)
{
  if( instr != 0 ) println(instr);
  if (chan == 0 && instr == 13)
  {
    introSamplePlayed = 1;
  }
  if (instr == 2)
  {
    chorusSamplePlayed = 1;
  }
}
