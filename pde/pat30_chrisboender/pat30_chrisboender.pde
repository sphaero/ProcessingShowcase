//REDNEOB, pat30

void modPatternEvent(int pos, int pattern)
{
   println(pos, pattern); 
}


import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720, 480);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat30.mod"));
  //  play it rightaway
  mplayer.play();
}

int bgcolor = 0;
static final int NUM_LINES =10;
float t;

void draw () {
  background(0);
  stroke(255, random(100, 255), 0); 
  noFill();
  strokeWeight(5);
  translate(width/2, height/2);

  for (int i = 1400; i > 0; i -= random(100, 300)) {
    ellipse(random(50,150), random(-50,-150), i, i);
  }

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
