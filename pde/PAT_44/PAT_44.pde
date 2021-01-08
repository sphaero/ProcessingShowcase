import procmod.*;

ModPlayer mplayer;

void setup()
{
  size(720, 480);
  frameRate(30);
  //println(frameCount);
  mplayer = new ModPlayer(this, dataPath("pat44.mod"));
  mplayer.play();
}

int P44speed = 10;
color P44kleur1 =color(0, 0, 255);
float P44ydirection1= 1.5;
float P44xdirection1= 1.5;
float P44xrandom1 =int(random(30, 690));
float P44yrandom1 =int(random(30, 450));
int P44xrandom2 =int(random(30, 690));
int P44yrandom2 =int(random(30, 450));
color P44kleur2 = color(255, 0, 255);
int P44ydirection2= 1;
int P44xdirection2= -1;
int P44formaat = 50;

void draw()
{
  background(0);
  P44circles2kleur(P44formaat);
}

void modRowEvent( int channel, int instrument, int note )
{
  if (channel == 0)
  {
    println(channel, instrument, note);
  }
  if (channel == 1)
  {
    if (note == 52)
    {
      P44formaat = 120;
    }
    if (note == 64)
    {
      P44formaat = 40;
    } 
    if (note == 0)
    {
      P44formaat = 80;
    }
    println(channel, instrument, note);
  }
  if (channel == 2)
  {
    println(channel, instrument, note);
    if (note == 61)
    {
     background(200); 
    }
    else
    {
     background(0); 
    }
  } 
  if (channel == 3)
  {
    println(channel, instrument, note);
  }
}

void P44circles2kleur(int afstand)
{
  {
    blendMode(EXCLUSION); //ADD, EXCLUSION, SCREEN, werken allemaal



    //CIRKEL 1

    stroke(P44kleur1);
   P44cirkel(P44xrandom1, P44yrandom1, afstand);
    P44xrandom1 = P44xrandom1 +( P44speed * P44xdirection1);
    P44yrandom1 = P44yrandom1 +( P44speed * P44ydirection1);

    if (P44xrandom1 > width-30)
    {
      P44xdirection1 = -1;
    }
    if (P44xrandom1 < 30)
    {
      P44xdirection1 = 1;
    }
    if (P44yrandom1 > height-30)
    {
      P44ydirection1 = -1;
    }
    if (P44yrandom1 < 30)
    {
      P44ydirection1 = 1;
    }

    //CIRKEL 2
    stroke(P44kleur2);
    P44cirkel(P44xrandom2, P44yrandom2, afstand);
    P44xrandom2 = P44xrandom2 +( P44speed * P44xdirection2);
    P44yrandom2 = P44yrandom2 +( P44speed * P44ydirection2);

    if (P44xrandom2 > width-30)
    {
      P44xdirection2= -1;
    }
    if (P44xrandom2 < 30)
    {
      P44xdirection2 = 1;
    }
    if (P44yrandom2 > height-30)
    {
      P44ydirection2 = -1;
    }
    if (P44yrandom2 < 30)
    {
      P44ydirection2 = 1;
    }

    //println(yrandom1);
    blendMode(NORMAL);
  }
}

void P44cirkel(float P44xpos, float P44ypos, int P44breedte)
{
  noFill();
  strokeWeight(10);
  int P44B = 30;
  while (P44B/3 < height || P44B/3 < width)
  {
    ellipse(P44xpos, P44ypos, P44B, P44B);
    P44B = P44B + P44breedte;
  }
}
