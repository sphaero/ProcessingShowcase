import procmod.*;
int s = 20;

int Size = 50;


//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720, 480, P3D);

  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat9.mod"));
  //  play it rightaway
  mplayer.play();
}

void modRowEvent( int channel, int instrument, int note )
{
  println(channel, instrument, note);
}

void draw() {
  background(3,3,3);



  if (second() % 2 == 0) {
    Size = 300;
    fill(0);
    strokeWeight(5);
    stroke(52,155,183);
 
    fill(0);
    strokeWeight(5);
    stroke(52,155,183);
    
  } else {
    Size = 50;
    fill(152,191,232);
    strokeWeight(3);
    stroke(3,81,162);
  }
  translate(350, 250, -50);
  rotateY(radians(s));
  box(Size);
  s = s + 10;
}
