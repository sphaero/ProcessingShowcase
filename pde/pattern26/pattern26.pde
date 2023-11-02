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


Float max_distance;

float ruis;
float t;
float X1(float t) {
  return sin(t / 10) * 100; 
}
float Y1(float t) {
  return cos(t / 10) * 100;
}

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
  max_distance = dist(0,0,width,height);
  noStroke();
}

void draw() 
{
  background(#9B5DE5);
  fill(#8FF75C);
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
   
  }
  if (channel2instr != 0 )
  { 
   
  }
  if (channel3instr != 0 )
  { 
     
  }
  if (channel4instr != 0 )
  { 
        ruis = 100;
  }
  else {
    ruis = 39;
  }
  

  
  for(int i = 0; i <= width; i += 17) {
    for(int j = 0; j <= height; j += 12) {
      float size = dist((X1(t))+width/2, (Y1(t))+height/2, i, j);
      size = size/max_distance * ruis;
      Float verplaatsing = random(-10,9);
      Float verplaatsing2 = random(-2,5);
      ellipse(i + verplaatsing, j + verplaatsing2, size, size);
    }
  t+= 0.02;  
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
    println( feedback_formatted );
  }
}
