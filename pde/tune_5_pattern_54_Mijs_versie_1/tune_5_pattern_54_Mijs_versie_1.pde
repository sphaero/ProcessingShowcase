import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
//int bgcolor = 0;

float x,y;
float xStep = 20;
float yStep = 20;
float a, a_;
int num;



void setup() {
  size(720,480);
  frameRate(30);
  num = int((width/xStep)*(height/yStep));
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("tune5.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() 
{
  background(15,20,30);
  strokeCap(CORNER);
  strokeWeight (xStep);
  int n=0;
  while (n<num) {
    stroke (255-255*cos(radians(a)),255*cos(radians(a)), 255-255*sin(radians(a)), 255*sin(radians(a)));
    line (x,y,x,y+yStep);
    x+=xStep;
   
   if (x>width){
     x=xStep/2;
     y+=yStep;
   }
   if (y>height) {
     y=0;
     a=0;
   }
   n++;
   a+=a_;
   
 }
a_+=0.05;


}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 1 && instrument == 54)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    a = note * 3;
  }
}
