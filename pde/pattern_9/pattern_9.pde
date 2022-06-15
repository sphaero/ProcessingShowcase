int count = 0;

void setup(){
  size(720,480);
  background(0);
//frameRate(2);
}
 void draw() {
  //noStroke(); 
  if(frameCount % 5 ==0)
  {
  stroke((0),(225), (102));
  strokeWeight(1);
  noFill();
  for (int i = 0 ; i <100; i ++){
    if (i % 2 == 0){
      stroke(0);}
      else{
        stroke((0),(225), (102));
      }
 square(random(0, width), random(0, height), random(12, 71));
  }
 }
}
