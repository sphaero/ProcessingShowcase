// door Madelief Kok
import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color

int instrument1played = 0;

PImage b;
PImage c;
PImage d;

void setup() {
  size(720, 480);

  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat22.mod"));
  //  play it rightaway
  mplayer.play();
  imageMode(CENTER);

  b = loadImage("hahahaha.png");
  c = loadImage("head.png");
  d = loadImage("wireframeoranje.png");

  frameRate(30);
}

void draw() {
  background(#390099);
  if (instrument1played == 0) {
    image(c, width/2, height/2);
    instrument1played = 0;
  } else if (instrument1played == 2) {  
    image(d, width/2, height/2);
    instrument1played = 0;
  } else {
    image(b, width/2, height/2);
    instrument1played = 0;
  }
}
//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (instrument == 0) {
    instrument1played = 1 ;
  }
  if (instrument == 3) {
    instrument1played = 2;
  }
  if (instrument == 7) {
    instrument1played = 3;
  }
}
