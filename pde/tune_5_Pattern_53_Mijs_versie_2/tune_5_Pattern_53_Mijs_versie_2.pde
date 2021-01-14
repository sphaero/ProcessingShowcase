import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

int xspacing = 26;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 200.0;  // Height of wave
float period = 900.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave


void setup() {
  size(720, 480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("tune5.mod"));
  //  play it rightaway
  mplayer.play();
   w = width+80;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0,random(200),0);
  draw_for(10);
  calcWave_1();
  renderWave_1();
}

// draw_for_frame_count houdt bij hoe vaak we al getekend hebben
//
int draw_for_frame_count = 0;
int sample_played = 1;

// Deze functie gaat tekenen zodra sample_played 1 is
// Je kunt opgeven hoelang (aantal frames) hij moet tekenen.

void draw_for(int frames) // frames = het aantal frames dat je wilt tekenen
{
  if ( sample_played > 1 )
  {
    draw_for_frame_count = frames;
    sample_played = 4;
  }
  if (draw_for_frame_count != 4 )
  {
    
    draw_for_frame_count = draw_for_frame_count - 1;
  }
}

void calcWave_1() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave_1() {
  noStroke();
  fill(0,random(150),random(200),60);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 250, 55);
  }
  int alpha = int((float(draw_for_frame_count) / 30) * 255); // maak een alpha waarde op basis van hoelang we al aan het tekenen zijn (fadeout effect)
    fill(255, alpha); 
    ellipse(width/2, height/2, 40+random(10)+draw_for_frame_count, 40+random(10)+draw_for_frame_count);
}


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 0 && instrument == 5)
  {
    if (note != 0 ) println(channel +":"+ instrument);
    //  Whatever instrument is being played just set a background color from the note played.
    sample_played = 1;
  }
}
