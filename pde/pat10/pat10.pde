import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

void setup() {
  size(720,480);
  background(255,255,255);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat10.mod"));
  //  play it rightaway
  mplayer.play();
}

float x,y,x2,y2,w;


void draw(){
for (int x = 0; x < 720; x += 20) {
for (int y = 0; y < 4800; y += 20) {
if ( random(0,10) > 5 ){
fill(ch2color);
rect(x, y, 50, 50);
} else {
// draw a diamond using quad();
fill(ch1color);
noStroke();
quad( x + 4, y + -4, x + 4, y + 4, x + 4, y + 4, x + -2 , y + 1);
}
}
}
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
  } 
  else if ( channel == 1 )
  {
    ch2color = color(0, 0, note * 8);
  }
  else if ( channel == 2 )
  {
    ch3color = color(channel*64, note * 8, instrument*64);
  }
  else if ( channel == 3 )
  {
    ch4color = color(0, instrument*64, note * 8);
  }
}
