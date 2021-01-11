import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw rectangle colors for every channel
color ch1color;
color ch2color;
color ch3color;
color ch4color;

void setup() {
  size(720,480);
  background(0);
  frameRate(30);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat4.mod"));
  //  play it rightaway
  mplayer.play();
}

float x,y,x2,y2,w;


void draw(){
background(ch4color);
translate(width/17,height/2);

for(int i=0;i<12;i++){
rotateX(radians(random(ch1color)));
stroke(ch2color);
strokeWeight(random(10,100));
x=random(-width,width*2);
y=-height;
x2=random(-width,width*2);
y2=height*ch3color;
line(x,y,x2,y2);
}
for(int i=0;i<12;i++){
rotateX(radians(random(360)));
stroke(0);
strokeWeight(random(50,100));
x=random(-width,width*2);
y=-height;
x2=random(-width,width*23);
y2=height*2;
line(x,y,x2,y2);
}
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
    ch1color = color(0, 0, instrument*30);
  } 
  else if ( channel == 1 )
  {
    ch2color = color(0, 0, note * 8);
  }
  else if ( channel == 2 )
  {
    ch3color = color(0, 0, instrument*20);
  }
  else if ( channel == 3 )
  {
    ch4color = color(0, 0, note * 4);
  }
}
