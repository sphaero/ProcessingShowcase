int speed = 0;
int col = 0;
int counter =0;
int revers = 0;
float rectSize = 50;

void setup()
{
  size(720, 480);
  background(80,10,100);
  
// for( int i = 0; i < width; i++){
// stroke(map(i,0,width,130,30),30,170-map(i,0,width,0,50));
// line(i,0,i,height); }
 

}

void draw() 
{
  doShit();

}
void doShit() {
  
  if (rectSize>200) {
  fill(col,0,100,80);
  noStroke();
  rect(-30 + speed,100, rectSize,rectSize);
  speed = speed + 12;
  col = col + 3;
  
  rect(720 + revers, 200, rectSize,rectSize);
  revers = revers -12;
  
  rect(50 , -200 + speed, rectSize,rectSize);
  rect(540 , -150 + speed, rectSize,rectSize);
  
  rect(300 , 450 + revers, rectSize,rectSize);
  
  rectSize = rectSize +2;
  
  }
 
 else if (rectSize>50){
  fill(col,0,100,80);
  noStroke();
  rect(-30 + speed,100, rectSize,rectSize);
  speed = speed + 2;
  col = col + 1;
  
  rect(720 + revers, 200, rectSize,rectSize);
  revers = revers -2;
  
  rect(50 , -200 + speed, rectSize,rectSize);
  rect(540 , -150 + speed, rectSize,rectSize);
  
  rect(300 , 450 + revers, rectSize,rectSize);
  
  rectSize = rectSize +0;
 }
 
 else {
  fill(col,0,100,80);
  noStroke();
  rect(-30 + speed,100, rectSize,rectSize);
  speed = speed + 12;
  col = col + 3;
  
  rect(720 + revers, 200, rectSize,rectSize);
  revers = revers -12;
  
  rect(50 , -200 + speed, rectSize,rectSize);
  rect(540 , -150 + speed, rectSize,rectSize);
  
  rect(300 , 450 + revers, rectSize,rectSize);
  
  rectSize = rectSize +3;
 }
}
