import netP5.*;
import oscP5.*;
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

int warningplayed = -1;
//#FFFFFF, #000000, #9B5DE5, #8FF75C

void setup()
{
  size(720,480);
  oscP5 = new OscP5(this,6200);
}

void centertriangle(int centerx, int centery, int size)
{
  noFill();
  
  float sizeh = size/2.;
  float xpos1 = sin((PI/180.)*0) * sizeh + centerx;
  float ypos1 = -cos((PI/180.)*0) * sizeh + centery;
  float xpos2 = sin((PI/180.)*-120)* sizeh + centerx;
  float ypos2 = -cos((PI/180.)*-120)* sizeh + centery;
  float xpos3 = sin((PI/180.)*120)* sizeh + centerx;
  float ypos3 = -cos((PI/180.)*120)* sizeh + centery;
  triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
  //circle(centerx, centery, size);
  //circle(cos(frameCount*0.1)*sizeh+centerx, sizeh, 20);
}
void mousePressed()
{
  warningplayed = -1;
}
void draw()
{
  background(0);
  if (warningplayed == -1 && (channel1instr == 18 || channel2instr == 18 || channel3instr == 18 || channel4instr == 18) )
  {
    warningplayed = frameCount;
  }
  int triangles = min(frameCount*4, 1860);
  for (int i=-150;i<triangles;i+=16)
  {
    float delta = 0.;
    if (warningplayed > 0)
    {
      delta = max(0, sin(i*0.005+(frameCount-425-warningplayed)*-0.05)*200-100);
      println(frameCount-warningplayed);
    }
    if (frameCount-warningplayed > 100)
    {
      warningplayed = -1;
    }
    //int size = i + (frameCount % 16)+ int(delta);
    int size = i;
    if (i < 900)
    {
      size = i + int(delta);
    }
    strokeWeight(1);
    if (size > 0)
    {
      stroke(255);
      if (i > 430)
      {
        stroke(255,0,0);
      }
      if (i > 540)
      {
        stroke(#9B5DE5);
      }
      centertriangle(width/2+int(random(-5,5)), 320+int(random(-3,2)), size);
    }
  }
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
    //println( feedback_formatted );
  }
}
