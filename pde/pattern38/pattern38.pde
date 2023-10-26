int a = 0;
int b = 0;
int c = 0;
int d = 0;

void setup() {
  size(720, 480);
  stroke(255);
}

void draw() {
  if(b>width/2){
  background(143, 247, 92);
  } else{
  background(155, 93, 229);
  }
  
textSize(10);
text("dipsy | 38",640,460);
  
  a = a + 25;
  b = b + 33; 
  c = c + 21;
  d = d + 12;
  circle(a, 360, height/2);
  fill(0,0,0);
  circle(b, 210, height/8);
  fill(0,0,0);
  circle(c, 120, height/4);
  fill(0,0,0);
  circle(d, 90, height/4);
  fill(0,0,0);
  
  if(a > width) {
    a = 0;
  if(b > width) {
    b = 0;
  if(c > width) {
    c = 0;
  if(d > width) {
    d = 0;
  }
  }
  }

    
  }
}
