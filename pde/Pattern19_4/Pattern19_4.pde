

float a = 0.0;
float s = 0.0;


void setup ()
{
  size(720, 480);
  noStroke();
  rectMode(CENTER);
  frameRate(12);
}

void draw() {
  
  background(70,35,122);
  
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/3, height/2);
  scale(s); 
  fill(243,167,18);
  rect(0, 0, 50, 50); 
  
  translate(75, 60);
  fill(255,0,127);
  scale(s);
  rect(0, 0, 50, 50);    
  
  translate(60, 60);
  fill(61,220,151);
  scale(a);
  rect(0, 0, 50, 50); 
  
  translate(width/10, height/10);
  scale(s); 
  fill(1,186,239);
  rect(0, 0, 100, 100); 
  
  translate(75, 60);
  fill(255,0,127);
  scale(s);
  rect(0, 0, 50, 50);  
  
  translate(width/11, height/11);
  scale(s);
  fill(243,167,18);
  rect(0, 0, 50, 50); 
  
   
}
