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
  background(0);
  //frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat8.mod"));
  //  play it rightaway
  mplayer.play();
  strokeWeight(7);
}

float x,y,x2,y2,w;


void draw() {
  background(0);
  for ( int x = 0; x < 20; x++ ) {
    for ( int y = 0; y < 20; y++ ) {
      //drawShape( x * 40 + 20, y * 240 + 50, 10 );
      stroke(ch1color);
      pushMatrix();
      translate(x * 50 + 20, y * 50 + 50);

      stroke(ch2color);
      //line( x * 40 + 20, y * 240 + 50, x * 40 + 20, y * 240 + 100 );
      rotate(random(-PI/2, PI/2));
      line(0, -30, 0, 5);

      popMatrix();
    }
  }
}
void drawShape( int x, int y, int n ) {
  for ( int i = 0; i < n; i++ ) {
    if ( random(10)>2) {
      if ( random(4)<1) {
        stroke(random(ch3color), random(ch2color), random(ch1color));
        strokeWeight(1.0);
        strokeCap(ROUND);
      } else {
        stroke(random(ch3color), random(ch2color), random(ch1color));
        strokeWeight(1.0);
        strokeCap(ROUND);
      }
      float rnd = i/2;
      int t = x - ( i * 10 ); // top
      int l = y - ( i * 50 ); // left
      float w = i * 20; // width
      float r = l + 10; // right
      line( l + random(45), t + random(45), r + random(45), t + random(45));
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
    ch1color = color(channel*64, 0, instrument*64);
  } 
  else if ( channel == 1 )
  {
    ch2color = color(instrument*64, 0, note * 8);
  }
  else if ( channel == 2 )
  {
    ch3color = color(channel*64, 0, instrument*64);
  }
  else if ( channel == 3 )
  {
    ch4color = color(0, 0, note * 8);
  }
}
