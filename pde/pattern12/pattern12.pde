float g;
float g2;

void setup(){
  background(0);
  size(720,480);
  
}

void draw() {
  
stroke(0,255,102);
 noFill();
 circle(1+g/2,240,g);
 
 stroke(244,244,244);
 noFill();
 circle(719+g2/2,240,g2);
 
 g = g + 5;
 g2 = g2 - 5;
 
  
}
