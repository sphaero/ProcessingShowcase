import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

float x, y, x2, y2, w;

void setup() {
  size(720, 480);
  background(0);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat11.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw () {
  background(0);
  noStroke();
  x = x + 60;

  if (x > width) {
    x = 0;
  }
  fill(random(ch1color), random(255), 255);
  ellipse(x, 0, 100, 200);
  ellipse(x, 100, random(200), 200);
  ellipse(x, 200, random(480/16), 300);
  ellipse(x, 300, random(480/8), 400);
  ellipse(x, 400, random(480/2), 500);
  ellipse(x, 500, random(480/4), 600);
}

//  This method is called every time an instrument is being played. 
//  Note: When no instrument is played on an iteration of the song 
//  (meaning continue playing the instrument) the instrument number
//  will be 0. We'll use that to change the color
void modRowEvent( int channel, int instrument, int note )
{
  println(channel +":"+ instrument +":"+ note);
  if (channel == 0)
  {
    ch1color = color(0, 0, instrument*64);
  } else if ( channel == 1 )
  {
    ch2color = color(instrument*64, channel*64, note * 8);
  } else if ( channel == 2 )
  {
    ch3color = color(channel*64, note * 8, instrument*64);
  } else if ( channel == 3 )
  {
    ch4color = color(0, instrument*64, note * 8);
  }
}
