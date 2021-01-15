import procmod.*;

// define a new instance of the ModPlayer
ModPlayer mplayer;
// we'll use this to draw rectangle colors for every channel



color ch1color;
color ch2color;
color ch3color;
color ch4color;

float beginX = 0;  // Initial x-coordinate
float beginY = 0;  // Initial y-coordinate
float endX =   0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

void setup() {
size(1000, 700);
  noStroke();
  distX = endX - beginX;
  distY = endY - beginY;  background(0);
  // Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat51.mod"));
  // play it rightaway
  mplayer.play();
  }
  
  
  void draw() {
    fill(0, 2);
  rect(0, 0, width, height);
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  


 
  ellipse(x, y, 900, 900);
   stroke(#0000ff);
 ellipse(x, y, 500, 500);
    stroke(#7c00ff);
   ellipse(x, y, 100, 100);
    stroke(#aedaff);
     ellipse(x, y, 300, 300);
    stroke(#d0b7f9);
  
  }
  
  // This method is called every time an instrument is being played.
  // Note: When no instrument is played on an iteration of the song
  // (meaning continue playing the instrument) the instrument number
  // will be 0. We'll use that to change the color
  void modRowEvent( int channel, int instrument, int note ) {
    println(channel +":"+ instrument +":"+ note);
    
    if (channel == 0) {
       
      ellipse(x, y, 50, 50);
    stroke(#0027b5);
  ellipse(x, y, 100, 100);
    stroke(#0027b5);
     ellipse(x, y, 300, 300);
    stroke(#0027b5);
    }
    
    println ();
    
    if (channel == 1); {
      ch2color = color(instrument*64, channel*64, note * 2);
    }
    if ( channel == 2 ) {
      ch3color = color(channel*64, note * 8, instrument*64);
    }
    else if ( channel == 3 ) {
    
    }
      pct = 0.0;
  beginX = 300;
  beginY = 350;
  endX = instrument*500;
  endY = note*64;
  distX = endX - beginX;
  distY = endY - beginY;
}
