// CODE GEBRUIKT & GEREMIXT VAN TUTORIAL: https://www.youtube.com/watch?v=zYgfVHKgfpY

import procmod.*;

int dim;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;

float angle;
float angletwo;
float anglethree;

void setup() {
  mplayer = new ModPlayer(this, dataPath("tune6.mod"));
  //  play it rightaway
  mplayer.play();
  size(720, 480);
  surface.setLocation(957, 0);
  noStroke();
}

void draw() {
  background(95, 66, 154);
  
  float x = width;
  int num = 100;
  
  translate(width/2, height/2);
  for (float a=0; a<360; a+=22.5) {
    rotate(radians(a));
    pushMatrix();
    for (int i=0; i<num; i++) {
      scale(0.95);
      rotate(radians(angle));
      ellipse(x, 0, 40, 40);
      fill(153, 255, 102);
    }
    popMatrix();
    
    pushMatrix();
    for (int i=0; i<num; i++) {
      scale(0.95);
      rotate(radians(anglethree));
      ellipse(x, 0, 100, 100);
      fill(153, 102, 255);
    }
    popMatrix();
    
    pushMatrix();
    for (int i=0; i<num; i++) {
      scale(0.95);
      rotate(-radians(angletwo));
      ellipse(x, 0, 30, 30);
      fill(255, 153, 0);
    }
    popMatrix();
   
    
  }
  angle-=0.02;
  angletwo-=0.01;
  anglethree-=0.05;
}

void modRowEvent( int channel, int instrument, int note )
{
// We will only respond to channel 0 (a MOD file usually only has 4 channels)
if (channel == 0)
{
println(channel +":"+ instrument +":"+ note);
// Whatever instrument is being played just set a background color from the note played.
bgcolor = note * 0;
}
}
