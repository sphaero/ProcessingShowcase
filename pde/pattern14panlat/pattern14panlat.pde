//Code gebruikt van Arnoud Loonstra
//Gemaakt met behulp van Madelief
//Door Mats Bleeker (of Panlat)
import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

int strokewidth2 = 1;
int draw_for_frame_count = 0;
int sample_played = 0;

void setup() {
  size (740, 480);
  frameRate (30);
  strokeWeight(5);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat14.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw()
{
  background (57, 0, 153);
  int xpos = 0;
  int ypos = 0;
  while ( xpos < width )
  {
    while ( ypos < height )
    {
      if ( random(1) >= 0.5 ) 
      {
        draw_verti(xpos, ypos);
      }
      else
      {
        draw_hori(xpos, ypos);
      }
      ypos = ypos + 10;
    }
    xpos = xpos + 10;
    ypos = 0;
  }
  richard();
}

void richard()
{
  int pos1 = int(width/2 + cos(frameCount*0.1)*200);
  int pos2 = int(height/2 + sin(frameCount*0.5)*300);
  int pos3 = int(height/2 + cos(frameCount*0.2)*100);
  int pos4 = int(height/2 + cos(frameCount*0.1)*50);
  strokeWeight(strokewidth2);
  stroke (255, 189, 0);
  line(pos1, pos2, pos4, pos3); 
}

void draw_hori(int xpos, int ypos) 
{
  line(xpos, ypos, xpos + 10, ypos);
}

void draw_verti(int xpos, int ypos) 
{
  line(xpos, ypos, xpos, ypos + 10);  
}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent ( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 2)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    strokewidth2 = note*2;
  }
  if (instrument == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    textSize(50);
    text("PANLAT", 740/3, 480/2); 
    fill(255, 255, 255);
  }
}
