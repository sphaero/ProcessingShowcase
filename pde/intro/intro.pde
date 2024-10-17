PFont f;
String[] lines;
int startLines = 0;
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
  startLines = 0;
  f = createFont("Amiga-Regular.ttf", 48);
  lines = loadStrings("intro.txt");
  oscP5 = new OscP5(this,6200);
  //textAlign(CENTER);
}

void draw() {
  float r = (-cos(frameCount*0.01)*127+127)*0.7;
  float rb = r*0.7;
  float g = (-cos(frameCount*0.005)*127+127)*0.7;
  float gb = g*0.7;
  background(rb, gb,0);
  if (channel2instr == 7 && startLines == 0)
    startLines = frameCount;
  textFont(f);
    
  if (startLines > 0)
  {
    fill(200,r,g);
    translate(0, -(frameCount-startLines));
    for (int i = 0 ; i < lines.length; i++) 
    {
      text(lines[i], 32, height+(i+1)*64);
    }
  }
  else
  {
    for (int i=0;i<30;i++)
    {
      rectMode(CENTER);
      noFill();
      strokeWeight(5);
      stroke((i+frameCount*0.2)*19%255, 127);
      rect(width/2, height/2, i*25, i*25);
    }
    fill(200,r,g, frameCount);
    textSize(200);
    text("TITLE", 100, 300);
  }
}

void oscEvent(OscMessage message) 
{
  if (message.checkAddrPattern("/patternevent" ) )
  {
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");    
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
