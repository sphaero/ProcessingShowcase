import procmod.*;

ModPlayer mplayer;

void setup()
{
  size(720, 480);
  frameRate(30);
  //println(frameCount);
  mplayer = new ModPlayer(this, dataPath("pat43.mod"));
  mplayer.play();
}

int P43aantal = 1;
int P43aantal2 = 1;
color P43K1 = 0;
int P43Formaat1 = 0;
int P43Formaat2 = 0;

void draw()
{
background(0);
cirkel(360, 240, P43Formaat1);
cirkelkleur(360, 240, P43Formaat2);

}

void modRowEvent( int channel, int instrument, int note )
{
  
  if(channel == 1)
  {
    println(channel, instrument, note);
    if(note == 0)
    {
     P43K1 = color(255, 0, 238);
     P43aantal2 = 8;
    }
    if(note == 52)
    {
     P43K1 = color(0, 0, 255);
     P43aantal2 = 4;
    }
    if(note == 64)
    {
     P43K1 = color(144, 0, 255);
     P43aantal2 = 6;
    }
  }
  
  if(channel == 2)
  {
    println(channel, instrument, note);
    if(note > 60)
    {
      P43aantal = P43aantal * 7;
    }
    else
    {
     P43aantal = 10;
    }
  }
  
  if(channel == 0)
  {
    println(channel, instrument, note);
  }
  
  if(channel == 3)
  {
    println(channel, instrument, note);
    if(note == 0)
    {
      P43Formaat1 = 40;
      P43Formaat2 = 60;
    }
    if (note == 68)
    {
     P43Formaat1 = 60;
     P43Formaat2 = 80;
    }
  }
}

void cirkel(int xpos, int ypos, int breedte)
{
  stroke(255);
  noFill();
  strokeWeight(10);
  int B = 30;
  for (int i = 0; i < P43aantal; i++)
  {
    ellipse(xpos, ypos, B, B);
    B = B + breedte;
  }
}

void cirkelkleur(int P43xpos, int P43ypos, int P43breedte)
{

  stroke(P43K1);
  noFill();
  strokeWeight(10);
  int P43B = 30;
  for (int i = 0; i < P43aantal2 ; i++)
  {
    ellipse(P43xpos, P43ypos, P43B, P43B);
    P43B = P43B + P43breedte + P43breedte;
  }

}
