//gebaseerd op: https://www.youtube.com/watch?v=UVXlrBwlp80
import procmod.*;


float t;
ModPlayer mplayer;

color ch1color;
color ch2color;
color ch3color;
color ch4color;

void setup() {
size(720,480);
background(0);
mplayer = new ModPlayer(this, dataPath("pat49.mod"));
mplayer.play();
}

void draw()
{
  fill(0, 10);
  rect(0,0, width, height);
  fill(127,255, 0);
  noStroke();
  ellipse(random(width), random(height), 10, 10);

  fill(0, 10);
  rect(0,0, width, height);
  fill(135,206,250);
  noStroke();
  ellipse(random(width), random(height), 7, 7);
}

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
