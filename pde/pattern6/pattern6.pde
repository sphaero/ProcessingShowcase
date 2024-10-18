int count = 0;
 int count2 = 300;
 int speed = 3;
 PShape ster; 
 
 import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = 0;
int patternnr = 0;
int patternrow = 0;
int channel1instr = 0;
int channel2instr = 0;
int channel3instr = 0;
int channel4instr = 0;
int channel1note = 0;
int channel2note = 0;
int channel3note = 0;
int channel4note = 0;
char channel1effect;
char channel2effect;
char channel3effect;
char channel4effect;
String channel1effect_param = "00";
String channel2effect_param = "00";
String channel3effect_param = "00";
String channel4effect_param = "00";
String feedback_formatted = "";
 
 void setup()
{
  size(720,480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
   size(720,480);

ster = createShape();
ster.beginShape();
ster.noStroke();
ster.fill(0,20,150);

//225 = 0
//225 = 0
//midden tot top = 75

ster.vertex(0,-175); //boven
ster.vertex(50,-70);  //rechtsboven midden
ster.vertex(150,-75); //rechtsboven punt
ster.vertex(70,0); //rechts midden
ster.vertex(90,150); //rechts onder punt
ster.vertex(0,50); //onder midden
ster.vertex(-90,150); //links onder punt
ster.vertex(-70,0); //links midden
ster.vertex(-150,-75); //links boven punt
ster.vertex(-50,-75); //linksboven midden
ster.endShape(CLOSE);
}
 
 void draw()
 {
background(0,250,70);
shape(ster,count,100);
shape(ster,count2,400);
  
  if(channel2instr % 4 == 3)
  {
    fill(255,255,255);
    rect(0,0,width,height);
  }
  else 
  {
  }
  
  if (count > width) //als de zon onder is en op komt {}
  {
    speed = -12;
  }
  if (count < 80)
  {
    speed = 12;
  }
  count = count + speed;
  count2 = count2 - speed;
 }
