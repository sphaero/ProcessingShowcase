int speed = 0;
int col = 0;
int counter =0;
int revers = 0;
float rectSize = 50;

void setup()
{
  size(720, 480);
  background(80,10,100);
  speed = 0;
  col = 0;
  counter =0;
  revers = 0;
  rectSize = 50;
  
    doShit();
  
// for( int i = 0; i < width; i++){
// stroke(map(i,0,width,130,30),30,170-map(i,0,width,0,50));
// line(i,0,i,height); }
 

}

void mousePressed(){
  frameCount=-1;
}

void draw() 
{
  doShit();

}
void doShit() {
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
 
