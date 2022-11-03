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
int num = 100;
int count = 0;
int speed = 5;

void flops (int xpos, int ypos)
{
  fill(255);
  triangle(xpos+50,ypos-100+sin(HALF_PI+frameCount*-0.15)*150,xpos+100,ypos+100,xpos+0,ypos+100);
}

void flopz (int xpos, int ypos)
{
  fill(255);
  triangle(xpos+50,200+ypos-sin(HALF_PI+frameCount*-0.15)*150,xpos+100,ypos,xpos+0,ypos);
}

void ruit (int xpos, int ypos)
{
  fill(255,0,0);
  count = count+speed;
  if(count>800)
  {
    speed = -5; 
  }
  if(count<-80)
  {
    speed=5;
  }
  println(count);
  quad(count, 180, count+15, 240, count, 300, count-15, 240);
}

void draw ()
{
  background (0);
  
  x=0;
  for (int i = 0; i <num-1; i++)
  {
    flops (x, 380);
    x+= 100;
  }
  
  x=0;
  for (int i = 0; i <num-1; i++)
  {
    flopz (x, 0);
    x+= 100;
  }
  
  ruit(0,0);
  
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
