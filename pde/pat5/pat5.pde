import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;
int smallPoint, largePoint;

void setup() {
  size(720,480);
  background(bgcolor);
  
  smallPoint = 300;
  largePoint = 500;
  imageMode(CENTER);
  noStroke();
  //  Load the supplied E4d7cYrmRhC1yposE0CL_tune1.mod file
  mplayer = new ModPlayer(this, dataPath("pat5.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(bgcolor);
  fill(0,0,255);
  points ();
  
  
}

void points (){
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(width));
  int y = int(random(height));
  ellipse(x, y, pointillize, pointillize);
  
}


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 9;
  }
}
