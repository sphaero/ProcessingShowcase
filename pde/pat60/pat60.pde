// Dancing girl 3.0 door Lucas Dijkman in pattern 60.  gezeik 
import procmod.*;
ModPlayer mplayer;

import processing.video.*;
Movie myMovie;

int strobe = 0;
int blep = 0;
int hmdl  = 0;

int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 100.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(720, 480);
  background(0);
  frameRate(30);
  myMovie = new Movie(this, "Dancing Girl 3.mov");
  myMovie.loop();
  mplayer = new ModPlayer(this, dataPath("pat60.mod"));
  mplayer.play();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw () {
  tint(strobe);
  image(myMovie, 0, 0);
  loadPixels();
  myMovie.loadPixels();
  drawingShapes();
  
  tint(blep);
  calcWave();
  renderWave();
  

  
}
void drawingShapes() {

  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 300, 300 );

  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 250, 250 );


  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 200, 200 );
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.03;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 15, 15);
  }
}

void drawCircle(){
  tint(blep);
  noFill();
  stroke(255);
  strokeWeight(30);
  ellipse(100,100,100,100);
}

  



void movieEvent(Movie m) {
  m.read();
}

void modRowEvent( int channel, int instrument, int note) {

  println(instrument);

  if (channel == 3)
  {
    strobe = note * 3;
  }
  if (instrument ==  11)
  {
    blep = note * 3;
  }

}
