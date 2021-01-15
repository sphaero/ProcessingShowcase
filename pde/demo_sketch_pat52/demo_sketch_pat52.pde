import procmod.*;

// define a new instance of the ModPlayer
ModPlayer mplayer;
// we'll use this to draw rectangle colors for every channel



color ch1color;
color ch2color;
color ch3color;
color ch4color;

float beginX = 60;  // Initial x-coordinate
float beginY = 800;  // Initial y-coordinate
float endX =   600;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 6;   // Determines the curve
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
  mplayer = new ModPlayer(this, dataPath("pat52.mod"));
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
  


 
  line(x, y, 900, 900);
   stroke(#8200ff);
    strokeWeight (1);
 line(x, y, 500, 500);
    stroke(#0000ff);
     strokeWeight (1);
   line(x, y, 10, 10);
    stroke(#0000ff);
     strokeWeight (2);
     line(x, y, 300, 300);
    stroke(#8200ff);
     strokeWeight (1);
    line(x, y, 10, 10);
   stroke(#0a1987);
 line(x, y, 400, 600);
    stroke(#8200ff);
     strokeWeight (5);
   line(x, y, 200, 500);
    stroke(#0000ff);
     strokeWeight (4);
     line(x, y, 60, 400);
    stroke(#0000ff);
      strokeWeight (10);
      tint(255, 126);
       line(x, y, 20, 600);
 stroke(#0a1987);
      strokeWeight (11);
    
 
    }
  
  
  
  // This method is called every time an instrument is being played.
  // Note: When no instrument is played on an iteration of the song
  // (meaning continue playing the instrument) the instrument number
  // will be 0. We'll use that to change the color
  void modRowEvent( int channel, int instrument, int note ) {
    println(channel +":"+ instrument +":"+ note);
    
    if (channel == 0) {
    line(x, y, 500, 500);
    stroke(#0000ff);
     strokeWeight (1);
  
  
    }
    
    println ();
    
    if (channel == 1); {
      ch2color = color(instrument*64, channel*64, note * 2);
      background(0);
    }
    if ( channel == 2 ) {
      ch3color = color(channel*64, note * 8, instrument*64);
      background(0);
    }
    else if ( channel == 3 ) {
    
    background(0);
    
    }
      pct = 0.0;
  beginX = 100;
  beginY = 400;
  endX = instrument*1500;
  endY = note*500;
  distX = endX  - beginX;
  distY = endY =1200 - beginY;
}
