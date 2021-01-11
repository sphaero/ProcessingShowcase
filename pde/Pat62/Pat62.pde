import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;

void setup() {
  size(720,480);
  background(bgcolor);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat62.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(bgcolor);
  fill(255);
  stroke(0);
  strokeWeight(2);

translate(width/2, height/2);

for (int i = 0; i < NUM_LINES; i++)
  {
  line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }

translate(width/-8, height/4);
stroke(255, 200, 100);

for (int i = 0; i < NUM_LINES; i++)
  {
  line(x3(t + i), y3(t + i), x4(t + i), y4(t + i));
  }

translate(width/8, height/-2);
stroke(255, 100, 200);

for (int i = 0; i < NUM_LINES; i++)
  {
  line(x5(t + i), y5(t + i), x6(t + i), y6(t + i));
  }
  t+= 0.1;

}


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
 void modRowEvent( int channel, int instrument, int note )
 {
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
 if (channel == 0)
  {
  //  println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 3;
  }
 }
 
 void modPatternEvent(int pos, int pattern)
{
   println(pos, pattern); 
}


static final int NUM_LINES = 20;

float t;


float x1(float t) {
  return sin(t / 10) * 100 + sin(t/ 9) * 366;
}
float y1(float t) {
  return cos(t / 10) * 100 + cos(t/ 366) * 9;
}

float x2(float t) {
  return sin(t / 10) * 200 + sin(t/ 33) * 99;
}
float y2(float t) {
  return cos(t / 10) * 200 + cos(t/ 99) * 33;
}




float x3(float t) {
  return sin(t / 10) * 100 + sin(t/ 5) * 300;
}
float y3(float t) {
  return cos(t / 10) * 100 + cos(t/ 300) * 5;
}

float x4(float t) {
  return sin(t / 10) * 200 + sin(t/ 10) * 120;
}
float y4(float t) {
  return cos(t / 10) * 200 + cos(t/ 120) * 10;
}



float x5(float t) {
  return -sin(t / 10) * 100 + -sin(t/ 5) * 300;
}
float y5(float t) {
  return -cos(t / 10) * 100 + -cos(t/ 300) * 5;
}

float x6(float t) {
  return -sin(t / 10) * 200 + -sin(t/ 10) * 120;
}
float y6(float t) {
  return -cos(t / 10) * 200 + -cos(t/ 120) * 10;
}
