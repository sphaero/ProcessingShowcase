//gebaseerd op:https://thecodingtrain.com/CodingChallenges/030-phyllotaxis.html
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

float n = 0;
float c = 3;

ArrayList<PVector> points = new ArrayList<PVector>();

float start = 0;

void setup() {
  size(720, 480);
  colorMode(RGB, 0, 20, 250);
  // Load the supplied test.mod file
mplayer = new ModPlayer(this, dataPath("pat50.mod"));
// play it rightaway
mplayer.play();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  rotate(n * 0.6);
  for (int i = 0; i < n; i++) {
    float a = i * radians(148);
    float r = c * sqrt(i);
    float x = r * cos(a);
    float y = r * sin(a);
    float hu = i+start;//sin(start + i * 0.5);
    hu = i/3.0 % 360;
    fill(hu, 127, 255);
    noStroke();
    ellipse(x, y, 2, 2);
  }
  n += 5;
  start += 5;
 
}

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
