 // pattern29

 
float diameter; 
float angle = 0;

void setup() {
  size(720,480);
  diameter = height - 3;
  noStroke();
  fill(255,255,255);
}

void draw() {
  
  background( 255,0,0);

  float d1 = 60 + (sin(angle) * diameter/22) + diameter/55;
  float d2 = 10 + (sin(angle + PI/2) * diameter/1) + diameter/2;
  float d3 = 4 + (sin(angle + PI) * diameter/33) + diameter/2;
  
  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);
  
  angle += 0.8;
}
