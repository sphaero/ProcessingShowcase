int a = 0;
int b = 0;
int c = 0;

void setup() {
  size(720, 480);
  stroke(255);
}

void draw() {
  if(c>width){
  background(143, 247, 92);
  } else{
  background(255,255,255);
  }
  
textSize(10);
text("dipsy | 36",640,460);
  
  a = a + 25;
  b = b + 33; 
  c = c + 21;
  rect(a, 0, a, height/2);
  fill(155, 93, 229);
  rect(b, height/2, b, height);
  fill(155, 93, 229);
  rect(c, random(480), c, height/4);
  fill(155, 93, 229);
  
  if(a > width) {
    a = 0;
  if(b > width) {
    b = 0;
  if(c > width) {
    c = 0;
  }
  }

    
  }
}
