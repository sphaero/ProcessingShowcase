import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int go_played = 0;


void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("babey.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(0);
  if (go_played == 1)
  {
    background(138, 231, 9);
    go_played=0; 
  fill(12, 176, 93);
  text("GO", 360, 240);
  }
  if (go_played == 2)
  {
    background(238, 131, 9);
    go_played=0; 
  fill(102, 66, 93);
  text("GO", 360, 240);
  }
  fill(123, 234, 43);
  text("GO", 260, 340);
  textSize(200);
}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (instrument == 4)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    go_played = 1;
  }
  if (instrument == 2)
    {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    go_played = 2;
  }
}
