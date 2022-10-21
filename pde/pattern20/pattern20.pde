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
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
  noStroke();
}

int x;
int y;
int num = 100;
float angle;
int count = 0;
int speed = 1;

void hops(int xpos, int ypos)
{
  fill(255,0,0);
  if (patternrow % 8 == 0)
  {
    fill (255,0,0);
  }
  quad(xpos+sin(HALF_PI+frameCount*-0.15)*10, ypos+sin(HALF_PI+frameCount*-0.15)*10, xpos+100+sin(PI+frameCount*-0.15)*10, ypos+sin(PI+frameCount*-0.15)*10, xpos+100+sin(HALF_PI+PI+frameCount*-0.15)*10, ypos+100+sin(HALF_PI+PI+frameCount*-0.15)*10, xpos +sin(TWO_PI+frameCount*-0.15)*10, ypos+100+sin(TWO_PI+frameCount*-0.15)*10);
}

void glops(int xpos, int ypos)
{
  fill (0);
  quad(5+xpos+sin(HALF_PI+frameCount*-0.15)*10, ypos+5+sin(HALF_PI+frameCount*-0.15)*10, xpos+95+sin(PI+frameCount*-0.15)*10, ypos+5+sin(PI+frameCount*-0.15)*10, xpos+95+sin(HALF_PI+PI+frameCount*-0.15)*10, ypos+95+sin(HALF_PI+PI+frameCount*-0.15)*10, xpos+5+sin(TWO_PI+frameCount*-0.15)*10, ypos+95+sin(TWO_PI+frameCount*-0.15)*10);
}

  
void draw()
{
  background(0);
 
  
  pushMatrix();
  
  x = 0;
  fill(255,0,0);
  for(int i = 0; i < num-1; i++) 
  {
    rect(x, 0, 1, 480);
    x+= 10;
  }
 
  popMatrix();
  
  x=0;
  for (int i = 0; i <num-1; i++)
  {
    hops (x+20, height/2-50);
    glops (x+20, height/2-50);
    x+= 190;
  }
  
   x=0;
  for (int i = 0; i <num-1; i++)
  {
    hops (x+20, 50);
    glops (x+20, 50);
    x+= 190;
  }
  
   x=0;
  for (int i = 0; i <num-1; i++)
  {
    hops (x+20, height-150);
    glops (x+20, height-150);
    x+= 190;
  }
  
  count = count+speed;
  if(count>320)
  {
    speed = -1;
  }
  if(count<0)
  {
    speed=1;
  }
  println(count);
  
  pushMatrix();
  translate(0,count);
  y = 0;
  fill(255,0,0);
  for(int i = 0; i < num-1; i++) 
  {
    rect(0, -480+y, 720, 1);
    y+= 10;
  }
  popMatrix();
  
  
  
}





void oscEvent(OscMessage message) 
{
  if (message.checkAddrPattern("/patternevent" ) )
  {
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");
    //print(" addrpattern: "+message.addrPattern());
    //println(" typetag: "+message.typetag());
    
    songposition = message.get(0).intValue();
    patternnr = message.get(1).intValue();
    patternrow = message.get(2).intValue();
    
    channel1note = message.get(3).intValue();
    channel1instr = message.get(4).intValue();
    channel1effect = message.get(5).charValue();
    channel1effect_param = message.get(6).stringValue();
    channel2note = message.get(7).intValue();
    channel2instr = message.get(8).intValue();
    channel2effect = message.get(9).charValue();
    channel2effect_param = message.get(10).stringValue();    
    channel3note = message.get(11).intValue();
    channel3instr = message.get(12).intValue();
    channel3effect = message.get(13).charValue();
    channel3effect_param = message.get(14).stringValue();
    channel4note = message.get(15).intValue();;
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |" , 
                                      patternnr, patternrow, 
                                      channel1note, channel1instr, channel1effect, channel1effect_param, 
                                      channel2note, channel2instr, channel2effect, channel2effect_param, 
                                      channel3note, channel3instr, channel3effect, channel3effect_param,
                                      channel4note, channel4instr, channel4effect, channel4effect_param
                                      );
    println( feedback_formatted );
  }
}
