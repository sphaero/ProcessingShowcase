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
  
  
 {
  for (int i = 0; i < width; i++) {
    float r = random(125);
    stroke(r);
    line(i, 0, 1, height);
  }
  }

  
   {
  float val = randomGaussian();

  float sd = 60;                
  float mean = width/5;          
  float x = ( val * sd ) + mean;  
  noStroke();
  fill(80,10,80);
  ellipse(x, height/2.5, 42, 42); 
  ellipse(x, height/6.5, 42, 42); 
  ellipse(x, height/1.5, 42, 42); 
  ellipse(x, height/3.5, 42, 42); 
  }
   {
  float val = randomGaussian();

  float sd = 60;                
  float mean = width/1;          
  float x = ( val * sd ) + mean;  
  noStroke();
  fill(100,10,80);
  ellipse(x, height/2.5, 42, 42); 
  ellipse(x, height/6.5, 42, 42); 
  ellipse(x, height/1.5, 42, 42); 
  ellipse(x, height/3.5, 42, 42); 
  }
  
   {
  float val = randomGaussian();

  float sd = 60;                
  float mean = width/2;          
  float x = ( val * sd ) + mean;  
  noStroke();
  fill(100,10,80);
  ellipse(x, height/2.5, 42, 42); 
  ellipse(x, height/6.5, 42, 42); 
  ellipse(x, height/1.5, 42, 42); 
  ellipse(x, height/3.5, 42, 42); 
  }
  
  //roze ster helemaal links
  fill(200,100,150);
  pushMatrix();
  translate(width*0.005, height*0.5);
  rotate(frameCount / 2.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  
  {
  for (int i = 0; i < width; i++) {
    float r = random(125);
    stroke(r);
    line(1, 0, i, height);
  }
  }
  
  
//roze ster helemaal rechts
  fill(200,100,150);
  pushMatrix();
  translate(width*1, height*0.5);
  rotate(frameCount / 2.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  //paarse ster links
  fill(150,50,150);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 1.0);
  star(5, 0, 5, 70, 3); 
  popMatrix();
  
  // roze ster in het midden
  fill(200,100,150);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 2.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  // paarse ster rechts
  fill(150,50,150);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 1.0);
  star(5, 0, 5, 70, 3); 
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

//DOOR DION AKA SABI.
