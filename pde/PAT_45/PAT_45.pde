import procmod.*;

ModPlayer mplayer;

void setup()
{
  size(720, 480);
  frameRate(30);
  mplayer = new ModPlayer(this, dataPath("pat45.mod"));
  mplayer.play();
}

int P45speed = 10;
color P45kleur1 =color(0, 0, 255);
float P45ydirection1= 1.5;
float P45xdirection1= 1.5;
float P45xrandom1 =int(random(30, 690));
float P45yrandom1 =int(random(30, 450));
int P45xrandom2 =int(random(30, 690));
int P45yrandom2 =int(random(30, 450));
color P45kleur2 = color(255, 0, 255);
int P45ydirection2= 1;
int P45xdirection2= -1;
int P45formaat = 90;
boolean P45B = true;

void draw()
{
  background(0);
  if(P45B == true)
  {
   P45circles2kleur(P45formaat); 
  }
  if(P45B==false)
  {
    P45rect2kleur(P45formaat);
  }
}

void modRowEvent( int channel, int instrument, int note )
{
  if (channel == 0)
  {
    println(channel, instrument, note);
    if (instrument == 5)
    {
      if(P45B == true)
      {
        P45B = false;
      }
      else
      {
       P45B = true; 
      }
    }
    if(instrument == 14)
    {
      P45kleur1 = color(0,0,173);
      P45kleur2 = color(165, 0, 173);
    }
    if(instrument == 15)
    {
      P45kleur1 = color(0,0,97);
      P45kleur2 = color(92, 0, 97);
    }
  }
  if (channel == 1)
  {
    if (note == 52)
    {
      P45formaat = 120;
      strokeWeight(20);
    }
    if (note == 64)
    {
      P45formaat = 150;
      strokeWeight(40);
    } 
    if (note == 0)
    {
      P45formaat = 80;
      strokeWeight(10);
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

void P45rect2kleur(int afstand)
{
  {
    blendMode(EXCLUSION);

    //CIRKEL 1

    stroke(P45kleur1);
    P45cirkel(P45xrandom1, P45yrandom1, afstand);
    P45xrandom1 = P45xrandom1 +( P45speed * P45xdirection1);
    P45yrandom1 = P45yrandom1 +( P45speed * P45ydirection1);

    if (P45xrandom1 > width-30)
    {
      P45xdirection1 = -1;
    }
    if (P45xrandom1 < 30)
    {
      P45xdirection1 = 1;
    }
    if (P45yrandom1 > height-30)
    {
      P45ydirection1 = -1;
    }
    if (P45yrandom1 < 30)
    {
      P45ydirection1 = 1;
    }

    //CIRKEL 2
    stroke(P45kleur2);
    P45cirkel(P45xrandom2, P45yrandom2, afstand);
    P45xrandom2 = P45xrandom2 +( P45speed * P45xdirection2);
    P45yrandom2 = P45yrandom2 +( P45speed * P45ydirection2);

    if (P45xrandom2 > width-30)
    {
      P45xdirection2= -1;
    }
    if (P45xrandom2 < 30)
    {
      P45xdirection2 = 1;
    }
    if (P45yrandom2 > height-30)
    {
      P45ydirection2 = -1;
    }
    if (P45yrandom2 < 30)
    {
      P45ydirection2 = 1;
    }

    blendMode(NORMAL);
  }
}

void P45cirkel(float P45xpos, float P45ypos, int P45breedte)
{
  noFill();
  int P45B = 30;
  while (P45B/3 < height || P45B/3 < width)
  {
    ellipse(P45xpos, P45ypos, P45B, P45B);
    P45B = P45B + P45breedte;
  }
}

void P45circles2kleur(int afstand)
{
  {
    blendMode(EXCLUSION); 

    //rechthoek 1

    stroke(P45kleur1);
    P45rect1(P45xrandom1, P45yrandom1, afstand);
    P45xrandom1 = P45xrandom1 +( P45speed * P45xdirection1);
    P45yrandom1 = P45yrandom1 +( P45speed * P45ydirection1);

    if (P45xrandom1 > width-30)
    {
      P45xdirection1 = -1;
    }
    if (P45xrandom1 < 30)
    {
      P45xdirection1 = 1;
    }
    if (P45yrandom1 > height-30)
    {
      P45ydirection1 = -1;
    }
    if (P45yrandom1 < 30)
    {
      P45ydirection1 = 1;
    }

    //rechthoek 2
    stroke(P45kleur2);
    P45rect1(P45xrandom2, P45yrandom2, afstand);
    P45xrandom2 = P45xrandom2 +( P45speed * P45xdirection2);
    P45yrandom2 = P45yrandom2 +( P45speed * P45ydirection2);

    if (P45xrandom2 > width-30)
    {
      P45xdirection2= -1;
    }
    if (P45xrandom2 < 30)
    {
      P45xdirection2 = 1;
    }
    if (P45yrandom2 > height-30)
    {
      P45ydirection2 = -1;
    }
    if (P45yrandom2 < 30)
    {
      P45ydirection2 = 1;
    }


    blendMode(NORMAL);
  }
}

void P45rect1(float P45xpos, float P45ypos, int P45breedte)
{
  noFill();
  int P45B = 30;
  while (P45B/3 < height || P45B/3 < width)
  {
    rectMode(CENTER);
    rect(P45xpos, P45ypos, P45B, P45B);
    P45B = P45B + P45breedte;
  }
}
