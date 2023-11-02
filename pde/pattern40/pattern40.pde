int a = 0;

void setup() {
  size(720, 480);
  stroke(255);
}

void draw() {
  if(a>width/2){
  background(143, 247, 92);
  } else{
  background(155, 93, 229);
  }
  
textSize(10);
text("dipsy | 40",640,460);
  
  a = a + 25;

  circle(a, 240, height/8);
  fill(0,0,0);
 
  if(a > width) {
    a = 0;

  }
}
