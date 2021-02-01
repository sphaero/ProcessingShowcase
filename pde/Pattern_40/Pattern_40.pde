import procmod.*;

ModPlayer plr;

  int introSamplePlayed = 0;
  int chorusSamplePlayed = 0;
  float intromult = 0.1;

  color circleFillCol = color(42,247,2);
  color circleBorderCol = color(22,129,1);
  color noiseCol = color(3,255,243);
  
  PFont fnt;

  //cirkels
  float diameter; 
  float angle = 0;

  //noise
  float increment = 0.01;
  float zoff = 0.0;  
  float zincrement = 0.02; 

  void setup() {
  size(720, 480);
  println(frameRate);
  frameRate(30);
  diameter = height - 10;
  noStroke();
  
}

  void draw() {
  
  background(0);
{
  
  
  
  //noise
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
 
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      float bright = random(0,255);
      

      pixels[x+y*width] = color(bright,bright,bright);
    }
  }
  updatePixels();
  
  zoff += zincrement; // Increment zoff
  
  
}
  //cirkels:
  
  stroke(126);
  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;
  //ellipse(width/2, height/2, d2, d2);
  
  //cirkels links
  fill(0, 0, 0);
  ellipse(0, height/1, d1, d1);
  ellipse(0, height/4, d1, d1);
  
  noStroke();
  colorMode(HSB, 100);
  for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
  }
}
  ellipse(0, height/4, d3, d3);
  ellipse(0, height/1, d3, d3);
  
  // cirkels rechts
  fill(0, 0, 0);
  ellipse(width, height/4, d3, d3);
  ellipse(width, height/1, d3, d3);
  
  noStroke();
  colorMode(HSB, 100);
  for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
  }
}
  ellipse(width/1, height/1, d2, d2);
  ellipse(width/1, height/4, d2, d2);
 
  angle += 0.02;
  
  
  // sterren:
  // ster links
  
  noStroke();
  colorMode(RGB, 100);
  for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 0);
  }
}
  
  fill(255,255,255);
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 1.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  // ster in het midden
  fill(0,0,255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 1.0);
  star(5, 0, 5, 70, 3); 
  popMatrix();
  
  fill(255,255,255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 1.0);
  star(0, 0, 5, 70, 3); 
  popMatrix();
  
  // ster rechts
  fill(255,255,255);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 1.0);
  star(0, 0, 5, 70, 3); 
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
