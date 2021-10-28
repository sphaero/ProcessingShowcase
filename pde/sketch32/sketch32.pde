
int grid = 50;
int margin = 80; 

void setup() { 
  size(720, 480);
 
}

void draw() { 
  background(0);
  noFill();
  stroke(270);
  
  float d = 70;
  
 for (int i = margin; i<width-margin; i+= grid) {
   for (int j= margin; j<height-margin; j+= grid) {
     
  float x1 = -random(d);
  float y1 = -random(d);
  float x2 = random(d);
  float y2 = -random(d);
  float x3 = random(d);
  float y3 = random(d);
  float x4 = -random(d);
  float y4 = random(d);
  
  stroke(random(4500),random(0),random(255));
  strokeWeight(3);
     pushMatrix();
     translate(i, j);
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
      popMatrix();
   }
 }

 
}
