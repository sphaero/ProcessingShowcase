int a = 0;
float b = 0.0;

void setup() {
  size(720, 480);
  stroke(255);
}

void draw() {
  background(143, 247, 92);
  
textSize(10);
text("dipsy | 35",640,460);
  
  a = a + 25;
  b = b + 33; 
  rect(a, 0, a, height/2);
  fill(155, 93, 229);
  rect(b, height/2, b, height);
  fill(155, 93, 229);
  
  
  if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
    
  }
}
