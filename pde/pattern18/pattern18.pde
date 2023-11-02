//Pattern 18
//Synth weg
//Khetieq

import netP5.*;
import oscP5.*;

OscP5 oscP5;



void setup()
{
  size(720, 480);
}

void draw()
{
  int count = 0;
  while (count < 40)
  {
    noStroke();
    background(0,0,0);
    fill(random(344));
     fill(random(280));
     fill(random(540));
    rect(random(720),random(480),30,80);
    rect(random(720),random(480),70,80);
    count = count + 1;
  }
}
