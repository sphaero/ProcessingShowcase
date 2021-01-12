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
    pushMatrix();
    rotate(radians(a));
    strokeWeight(instrument1played+1);
    stroke(#9E0059);
    line(instrument1played,instrument1played,instrument1played, 200);
    popMatrix();
  }
}


void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (instrument == 0) { //3 = bas, 0 = hahaha
    instrument1played = 1 ;
  }
}
