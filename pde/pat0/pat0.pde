import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat0.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  // Background
  setGradient(0, 0, width/2, height, ch1color, ch2color, X_AXIS);
  setGradient(width/2, 0, width/2, height, ch3color, ch4color, X_AXIS);

}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
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
    ch3color = color(0, 0, instrument*64);
  }
  else if ( channel == 3 )
  {
    ch4color = color(0, 0, note * 8);
  }
}
