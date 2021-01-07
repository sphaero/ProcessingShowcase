import procmod.*;
int sizeX=50;
int sizeY=50;
int groeiX=5;
int groeiY=3;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720, 480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat6.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  frameRate(100);
  ellipse(width/2, height/2, sizeX, sizeY);

  sizeX=sizeX+groeiX;
  sizeY=sizeY+groeiY;

  if (sizeX>=720) {
    groeiX=-5;
  }

  if (sizeY>=480) {
    groeiY=-2;
  }

  if (sizeX<=10) {
    groeiX=5;
  }

  if (sizeY<=10) {
    groeiY=2;
  }
} 
