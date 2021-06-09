import netP5.*;
import oscP5.*;

OscP5 oscP5;

int size = 10;
int centerX_1, centerY_1;
int centerX_2, centerY_2;
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

color paars = color (70,35,122);
color groen = color (61,220,151);
color geel = color (243,167,18);
color blauw = color (1,186,239);
color roze = color (255,0,127);

void setup()
{
  size (720,480);
  oscP5 = new OscP5(this,6200);
  centerX_1 = width/2-200;
  centerY_1 = height/2;
  centerX_2 = width/2+200;
  centerY_2 = height/2;
  noFill();
  stroke(255);
  strokeWeight(10);
}

void draw()
{
  background(0);
  blendMode (ADD);
  stroke(255);
  strokeWeight(10);
  if (channel2instr == 1)
  {
   draw_circles_right(centerX_2,centerY_2,50);
  }
  if (channel3instr == 14 || channel3instr == 16)
  {
    draw_circles_left(centerX_1, centerY_1,50);
  }
  else
  {
    background(0);
  }
}

void draw_circles_left(int centerX,int centerY, int size)
{
  noFill();
  stroke(groen);
  strokeWeight(10);
  ellipse(centerX_1, centerY_1, size, size);
  if(size<1500)
  {
    draw_circles_left(centerX_1,centerY_1,size+50);
  }
  fill(255);
}

void draw_circles_right(int centerX, int centerY, int size)
{
  noFill();
  stroke(roze);
  strokeWeight(10);
  ellipse(centerX_2, centerY_2, size, size);
  if(size<1500)
  {
    draw_circles_right(centerX_2, centerY_2, size+50);
  }
  fill(255);
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
