import procmod.*;
PFont font;
PImage img;




//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;
int rectding = 0;
int rectdingen = 0;

float x, y;
float xStep = 20;
float yStep = 20;
float a, a_;
int num;

//fullscreen
//int q = 0;
 

void setup() {
  
// Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);

//fullScreen();
  size(720,480);
  //font = createFont("SharpGroteskSmBold23", 24);
  //textFont(font);
  
img = loadImage("electro-02-02.png");
  background(bgcolor);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt2.mod"));
  //  play it rightaway
  mplayer.play();
  
  num = int((width/xStep)*(height/yStep));
 
 
}

void draw() {
  //rect(q, height*0.2, 1, height*0.6); 
  //q = q + 2;
  
  
  background(0,0,0);
  strokeWeight(12);
  strokeCap(CORNER);
  stroke(20);
  
  int n=0;
  while (n<num) {
    //stroke (255-255*cos(radians(a)),72-255*cos(radians(a)),3-255*cos(radians(a)),1000*sin(radians(a)));
    stroke (#9C61FF*sin(radians(a)));
    
    line(x, y, x, y+yStep);
    x+=xStep;
    if (x>width){
      x=xStep/2;
      y+=yStep;
    }
    if (y>=height){
      y=0;
      a=0;
    }
    n++;
    a+=a_;
     
  }
  a_+=0.012;
  //a_+=0.012+rectding;





noStroke();
fill(255,255,255,1000*rectding);
rect(0,0,720,480);


  
  

  
  
//fill(#9C61FF);   




imageMode(CENTER);
//tint(255,72,3,1000*bgcolor);
tint(255,255,255,1000*bgcolor);
image(img,width/2,height/2,720,480);



 }


  
  


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 2)
  {
    rectding = note * 7;
  }
  
  if (channel == 0)
  {
    rectdingen = note * 1;
  }
  
  
  //Background//
  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 2;
  }

}

  
