int frame = 0;
int col = 0;
int counter =0;
int revers = 0;
float pos = 0;

int rectEndPos = 100;
int gap = 17;
int rectStartPos = gap;
int nextRectMargin = rectEndPos + gap;
int frameRateValue = 20;
int startTop = 0;

int red = 0;
int green = 0;
int blue = 0;
int alpha = 80;

void setup()
{
  size(720, 480);
  generateRandomColor();
  background(red,green,blue);
}

void generateRandomColor() {
  red = (int)random(0,255);
  green = (int)random(0,255);
  blue = (int)random(0,255);
}

void draw() 
{
  
  fill(red + col,green,blue,alpha);
  noStroke();
  
 if(frame>480) {
   background(red,green,blue);
   frame = 0;
   startTop = 480;
   frameRateValue = frameRateValue*-1;
   col = col * -1;
   generateRandomColor();
 } else if (frame<-480) {
   background(red,green,blue);
   frame = 0;
   startTop = 0;
   frameRateValue = frameRateValue*-1;
   col = col * 0;
   generateRandomColor();
 } else {
   col =col + 3;
 }
 
 for(int i =0;i<300;i++) {
   rect(rectStartPos + i*nextRectMargin,startTop,rectEndPos, frame*random(1f));
 }
 
 frame = frame + frameRateValue;
}


//void doShit() {
//  fill(col,0,100,80);
//  noStroke();
//  rect(-30 + speed,100, 50,50);
//  speed = speed + 12;
//  col = col + 3;
  
//  rect(720 + revers, 200, 50,50);
//  revers = revers -12;
  
//  rect(50 , -200 + speed, 50,50);
//  rect(540 , -150 + speed, 50,50);
  
//  rect(300 , 450 + revers, 50,50);
//}
