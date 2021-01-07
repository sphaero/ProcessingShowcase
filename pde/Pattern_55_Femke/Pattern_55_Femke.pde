import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;

float a = 0.0;
float s = 0.0;

void setup() {
  size(720, 480);
  //frameRate (30);
  background(bgcolor);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat55.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(0, 0, 0);

  a = a + 0.04;
  s = cos(a)*2;

  translate(355, 240);
  scale(s); 
  fill(255,0,255);
  ellipse(0, 0, 50, 50); 

  translate(75, 0);
  fill(255,174,185);
  scale(s);
  ellipse(0, 0, 50, 50);     

  translate(110, 0);
  fill(238, 18, 137);
  scale(s);
  ellipse(0, 0, 50, 50);
  
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
    bgcolor = note * 3;
  }
}
