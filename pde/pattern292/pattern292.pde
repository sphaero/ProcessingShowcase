 // pattern29

 
float diameter; 
float angle = 0;

void setup() {
  size(720,480);
  diameter = height - 30;
  noStroke();
  fill(255,0,0);
}

void draw() {
  
  background(  255,255,255);

  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;
  
  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);
  
  angle += 0.9;
}
