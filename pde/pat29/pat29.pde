//Eline van der Linde
//tune 3, pat29

void modPatternEvent(int pos, int pattern)
{
   println(pos, pattern); 
}



import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720, 480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat29.mod"));
  //  play it rightaway
  mplayer.play();
}

int bgcolor = 0;
static final int NUM_LINES =50;
float t;

void draw () {
  background (250,4,51);
  stroke (261,40,524);
  strokeWeight (6);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++){
  line (x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
 t += 0.3;
}

float x1(float t) {
  return sin(t/2) / 50 + sin(t+6) * 1;
}

float y1(float t) {
  return cos(t/2) * 5;
}

float x2(float t) {
  return sin(t/2) * 2000 + sin(t) * 155;
}

float y2(float t) {
  return cos(t/2) * 2000 + cos(t/1) * 200;
}



void modRowEvent( int channel, int instrument, int note )
{

  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
   
    bgcolor = note * 3;
  }
}
