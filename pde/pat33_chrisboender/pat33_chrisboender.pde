//REDNEOB, pat 33

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
  mplayer = new ModPlayer(this, dataPath("pat33.mod"));
  //  play it rightaway
  mplayer.play();
}

int bgcolor = 0;
static final int NUM_LINES =10;
float t;

void draw () {
  background(0);
  noFill();
  
  for ( int i = 0; i < 50; i++ ) {
    if ( random(10)>2) {
      if ( random(4)<1) {
        stroke(0, 200, 0);
        strokeWeight(random(6));
      } else {
        stroke(255, random(100, 255), 0); 
        strokeWeight(random(10));
      }
      float d = 720;
      float x = random(d);
      float y = random(d);
      float s = random(25,75);

      ellipse(x, y, s, s);
    }
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
