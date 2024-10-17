 int count = 0;
 int speed = 3;
 
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
}
 
 void draw()
 {
  background(0, 0, 255);
  fill(255,255,255);
  ellipse(360, count, 260, 260);
  fill(0,0,0,255);
  ellipse(360, height-count, 260, 260);
  stroke(0,0,0,255);
  
  if(channel2instr % 4 == 3)
  {
    fill(255,255,255);
    rect(0,0,width,height);
  }
  else 
  {
  }
  
  if (count > width-80) //als de zon onder is en op komt {}
  {
    speed = -12;
  }
  if (count < 80)
  {
    speed = 12;
  }
  count = count + speed;
 }
