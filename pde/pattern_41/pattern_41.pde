import procmod.*;

ModPlayer plr;

int introSamplePlayed = 0;
int chorusSamplePlayed = 0;
float intromult = 0.1;

color circleFillCol = color(42,247,2);
color circleBorderCol = color(22,129,1);
color noiseCol = color(3,255,243);

PFont fnt;

int unit = 40;
int count;
Module[] mods;


int dim;

void setup() {
  size(720, 480);
  {
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];

  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
    }
  }
}

void draw() {
 {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

  
  //cirkels:
  fill(0,200,0);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 10.);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  fill(150,0,0);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 10.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  fill(0,200,0);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 10.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}


class Module {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);
      y = y + (1 * yDirection);
    }
    if (y >= unit || y <= 0) {
      yDirection *= -1;
      y = y + (1 * yDirection);
    }
  }
  
  // Custom method for drawing the object
  void display() {
    fill(150);
    ellipse(xOffset + x, yOffset + y, 6, 6);
  }
  
  
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

void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
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
