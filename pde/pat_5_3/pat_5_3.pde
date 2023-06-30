// made by Anna 

//FIX COLOURS

//NO BACKGROUNDS PLEASE 
PImage previousFrame;

float circle1X = 580;
float circle1Y = 410;
float circle2X = 320;
float circle2Y = 190;
float circle3X = 250;
float circle3Y = 180;
float circle4X = 490;
float circle4Y = 350;
float circle5X = 550;
float circle5Y = 180;

/*
float speed1 = 1.0;
float speed2 = 2.0;
float speed3 = 2.5;
float speed4 = 1.5;
float speed5 = 2.0;
*/ 

float angle = 0; 
int radius = 5;

float xspeed1 = 2.8;  // Speed of the shape
float yspeed1 = 2.2;  // Speed of the shape

float xspeed2 = 2.8;  // Speed of the shape
float yspeed2 = 2.2;  // Speed of the shape

float xspeed3 = 2.8;  // Speed of the shape
float yspeed3 = 2.2;  // Speed of the shape

float xspeed4 = 2.8;  // Speed of the shape
float yspeed4 = 2.2;  // Speed of the shape

float xspeed5 = 2.8;  // Speed of the shape
float yspeed5 = 2.2;  // Speed of the shape

//int xdirection = 1;  // Left or Right
//int ydirection = 1;  // Top to Bottom



void setup() 
{
  size(720,480);
  previousFrame = createImage(width, height, RGB); // Create an empty image for storing the previous frame

 // background(0,0,0);
}

  void draw() 
{
  // Redraw the previous frame using tint()
  tint(255, 128); // Apply transparency to the previous frame
  
  // Draw the previous frame
  image(previousFrame, 0, 0);
  
  // start drawing tile
  AnnasTile();
  
  circle1X = circle1X + cos(angle-2)*radius * xspeed1;
  circle1Y = circle1Y + sin(angle-2)*radius * yspeed1;
  
  circle2X = circle2X + cos(angle+5)*radius * xspeed2;
  circle2Y = circle2Y + sin(angle+5)*radius * yspeed2;

  circle3X = circle3X + cos(angle+2)*radius * xspeed3;
  circle3Y = circle3Y + sin(angle+2)*radius * yspeed3;

  circle4X = circle4X + cos(angle+3)*radius * xspeed4;
  circle4Y = circle4Y + sin(angle+3)*radius * yspeed4;

  circle5X = circle5X + cos(angle+8)*radius * xspeed5;
  circle5Y = circle5Y + sin(angle+8)*radius * yspeed5;


//DO THIS FOR X AND Y AND FOR EVERY CIRCLE!!! 

 if (circle1Y < 0 || circle1Y > height)
 {
   yspeed1*=-1;
 }
   
 if (circle1X < 0 || circle1X > width)
 {
   xspeed1*=-1;
 }

//CIRCLE 2
 if (circle2X < 0 || circle2X > width)
 {
   xspeed2*=-1;
 }
   
 if (circle2Y < 0 || circle2Y > height)
 {
   yspeed2*=-1;
 }
 
 //CIRCLE 3
  if (circle3X < 0 || circle3X > width)
 {
   xspeed3*=-1;
 }
   
 if (circle3Y < 0 || circle3Y > height)
 {
   yspeed3*=-1;
 }
 
 
  //CIRCLE 4
  if (circle4X < 0 || circle4X > width)
 {
   xspeed4*=-1;
 }
   
 if (circle4Y < 0 || circle4Y > height)
 {
   yspeed4*=-1;
 }
 
  //CIRCLE 5
  if (circle5X < 0 || circle5X > width)
 {
   xspeed5*=-1;
 }
   
 if (circle5Y < 0 || circle5Y > height)
 {
   yspeed5*=-1;
 }
 


  angle += PI*50+(sin(angle)+20);
  
// Store the current frame as the previous frame
  previousFrame.copy(0, 0, width, height, 0, 0, width, height);

}



void AnnasTile() {

  //circle 1 (bottom)
  strokeWeight(1);
  stroke(50,150,200);
  fill(128, 128, 0); // (228, 128, 80); //(0,125,255); (128, 128, 0);
  circle(circle1X, circle1Y, 120);

  //circle 2
  strokeWeight(1);
  stroke(50,150,200);
  fill(255, 113, 52); // (255, 219, 88); //(255,155,30); (255, 113, 52);
  circle(circle2X, circle2Y, 90);
  
  //circle 3
    strokeWeight(1);
  stroke(50,200,200);
  fill(255, 219, 88); //(255, 113, 52); //(255,255,0); (255, 219, 88);
  circle(circle3X, circle3Y, 50);
  
  //circle 4
    strokeWeight(1);
  stroke(50,200,200);
  fill(235, 215, 168); //(255, 203, 52); //(255,255,0); (235, 215, 168)
  circle(circle4X, circle4Y, 50);
  

  //circle 5
    strokeWeight(1);
  stroke(50,200,200);
  fill(235, 215, 230); // (255, 153, 152); //(255,255,0); (235, 215, 230)
  circle(circle5X, circle5Y, 50);
  
}
  

 
