import procmod.*;
static final int NUM_LINES = 1;

float t;
// define a new instance of the ModPlayer
ModPlayer mplayer;
// we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

void setup() {
size(740,480);
background(0);
// Load the supplied test.mod file
mplayer = new ModPlayer(this, dataPath("pat48.mod"));
// play it rightaway
mplayer.play();
}

void draw() {
  strokeWeight(3);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++) {
    line (x1(t + i), y1(t + i), x2(t + i), y2(t + i));
    stroke(127,255,0);
  }
  t += 0.5;
}

float x1(float t) {
  return sin(t / 10) * 100 + sin(t / 5) * 20;
}

float y1(float t) {
  return cos(-t / 10) * 100 + sin(t/5) * 50;
}

float x2(float t) {
  return sin (t / 10) * 200 + cos(t) * 10;
}

float y2(float t) {
  return cos(t / 20) * 200 + cos(t / 12) * 20;
}

// This method is called every time an instrument is being played. 
// Note: When no instrument is played on an iteration of the song 
// (meaning continue playing the instrument) the instrument number
// will be 0. We'll use that to change the color
void modRowEvent( int channel, int instrument, int note )
{
println(channel +":"+ instrument +":"+ note);
if (channel == 0)
{
ch1color = color(channel*64, note * 8, instrument*64);
} 
else if ( channel == 1 )
{
ch2color = color(instrument*64, channel*64, note * 8);
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
