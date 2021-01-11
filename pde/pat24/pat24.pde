import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

float sw, alpha;
float ystep = 10;
float arcSize = 200;
int instrument1played = 0;

void setup () {
  size(720, 480);
  frameRate(30);
  mplayer = new ModPlayer(this, dataPath("pat24.mod"));
  //  play it rightaway
  mplayer.play();

}

void draw () {
  background(#FF5400);

  noFill();
  if (instrument1played == 1) {

    translate(width/2, height/2);
    for (int a = 0; a < 360; a++) {
      float x = map(a, 0, instrument1played, 0, width);
      float xx = map(a+2, 0, instrument1played, 0, width);
      pushMatrix();
      rotate(radians(a));
      strokeWeight(instrument1played+1);
      stroke(#390099);

      line(-100 + instrument1played*-100, -100+ instrument1played*10, 500+instrument1played*-30, 300);
      popMatrix();
    }
    instrument1played = 0;
  }
  translate(width/2, height/2);
  for (int a = 0; a < 360; a++) {
    float x = map(a, 0, instrument1played, 0, width);
    float xx = map(a+2, 0, instrument1played, 0, width);
    pushMatrix();
    rotate(radians(a));
    strokeWeight(instrument1played+1);
    stroke(#9E0059);

    line(-203 + instrument1played*-381, -3 + instrument1played*39, 276+instrument1played*-61, 119);
    popMatrix();
  }
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
