int a = 0;

void setup() {
  size(720, 480);
  stroke(255);
}

void draw() {
  if(a>width/2){
  background(0,0,0);
  } else{
  background(255,255,255);
  }
  
textSize(10);
text("dipsy | 43",640,460);
  
  a = a + 25;

  circle(a, 240, height/8);
  fill(155, 93, 229);
 
  if(a > width) {
    a = 0;

  }
}
