import procmod.*;

ModPlayer mplayer;

float sw, alpha;
float ystep = 20;
float arcSize = 400;
int instrument1played = 0;

void setup () {
  size(720, 480);
  frameRate(30);
  mplayer = new ModPlayer(this, dataPath("pat23.mod"));
  //  play it rightaway
  mplayer.play();

}

void draw () {
  background(0);

  noFill();
  if (instrument1played == 1) {
    //image(b, width/2, height/2);
    instrument1played = 0;
    stroke(#ff5400);
    strokeWeight(sw*instrument1played);
  } else {
    stroke(#9E0059);
    strokeWeight(10*instrument1played);
    instrument1played = 0;
  }
  for (int y=0; y<height; y+=ystep) {
    sw = map(sin(radians(y+alpha)), -1, 1, 2, ystep);
    strokeWeight(sw*instrument1played);
    for (int x=0; x<width+arcSize; x+=arcSize) {
      arc(x, y, arcSize/2, arcSize, 0, PI);
      arc(x+arcSize/2, y, arcSize/2, arcSize/2, PI, TWO_PI);
    }
  }
  alpha ++;

}

void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (instrument == 0) { //3 = bas, 0 = hahaha
    instrument1played = 1 ;
  }
  if (instrument == 7) {
    instrument1played = 2;
  }
}
