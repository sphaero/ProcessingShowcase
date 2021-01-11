
//Tune 1 Pattern 6 door Julia Arbouw 
//@julialena.art instagram


import procmod.*;
int sizeX=720;
int sizeY=480;
int groeiX=5;
int groeiY=3;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720, 480);
  background(0,0,255);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat6.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  frameRate(30);
  fill(255);
  strokeWeight(1);
  stroke(0);
  ellipse(width/2, height/2, sizeX, sizeY);

  sizeX=sizeX+groeiX;
  sizeY=sizeY+groeiY;

  if (sizeX>=720) {
    groeiX=-15;
  }

  if (sizeY>=480) {
    groeiY=-9;
  }

  if (sizeX<=10) {
    groeiX=15;
  }

  if (sizeY<=10) {
    groeiY=9;
  }
} 
