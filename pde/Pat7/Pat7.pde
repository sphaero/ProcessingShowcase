import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

int bgcolor = 0;
static final int NUM_LINES = 66;
float t; 

void setup() {
  size(720,480);
  background(0);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat7.mod"));
  //  play it rightaway
  mplayer.play();

}

void draw() {


  
background(0,0,0);
stroke(152,191,232);
strokeWeight(1);

translate(width/2, height/2);


for (int i = 0; i < NUM_LINES; i++)
  {
  line(x1(t + i+ch1color/8), y1(t + i), x2(t + i), y2(t + i));
  }

  stroke(52,155,183);
  
  for (int i = 0;i<NUM_LINES;i++)
  {
  line(x3(t + i), y3(t + i+ch2color/8), x4(t + i), y4(t + i));
}
 stroke(3,81,162);
    translate(width/-9, height/-6);
for (int i = 0;i<NUM_LINES;i++)
  {
  line(x5(t + i+ch3color/8), y5(t + i), x6(t + i), y6(t + i));
  }
 
    
  
  t+= 0.1;

}


float x1(float t) {
  return sin(t / 10) * 100 + sin(t/ 9) * 220;
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
  return sin(t / 40) * 100 + sin(t/ 30) * 220;
}
float y3(float t) {
  return cos(t / 40) * 50 + cos(t/ 220) * 30;
}

float x4(float t) {
  return sin(t / 10) * 200 + sin(t/ 33) * 99;
}
float y4(float t) {
  return cos(t / 10) * 200 + cos(t/ 99) * 33;
}

float x5(float t) {
  return sin(t / 40) * 100 + sin(t/ 30) * 220;
}
float y5(float t) {
  return cos(t / 40) * 5 + cos(t/ 220) * 30;
}

float x6(float t) {
  return sin(t / 10) * 200 + sin(t/ 33) * 99;
}
float y6(float t) {
  return cos(t / 10) * 180 + cos(t/ 99) * 33;

}




//  This method is called every time an instrument is being played. 
//  Note: When no instrument is played on an iteration of the song 
//  (meaning continue playing the instrument) the instrument number
//  will be 0. We'll use that to change the color
void modRowEvent( int channel, int instrument, int note )
{
  println(channel +":"+ instrument +":"+ note);
  if (channel == 0)
  {
    ch1color = color(channel*64, note * 8, instrument*64);
  } 
  else if ( channel == 1 )
  {
    ch2color = color(instrument*64, channel*64, note * 8);
  }
  else if ( channel == 2 )
  {
    ch3color = color(channel*64, note * 8, instrument*64);
  }
  else if ( channel == 3 )
  {
    ch4color = color(0, instrument*64, note * 8);
  }
}
