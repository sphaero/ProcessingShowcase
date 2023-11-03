import netP5.*;
import oscP5.*;

OscP5 oscP5;

float t;
float aberation;
float opacity;
static final int NumLines = 10;
int songposition = 0;
int patternnr = 0;
int patternrow = 0; //metrum van het nummer
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

float x1(float t) {
  return cos(t/3)* 59 + cos(1/6) * 59; 
}
float y1(float t) {
  return sin(t/8)* 4 + sin(t/5)*138; 
}
float x2(float t) {
  return cos(t/7)* 81 + sin(1/7) + -47; 
}

float y2(float t) {
  return sin(t/8)* 205 + sin(t/7)*42 +-10; 
}


void setup()
{
  size(720, 480);
  frameRate(60);
  blendMode(ADD);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background (46, 36, 24);
  strokeWeight(5);
  

  

  

  for (int i = 0; i < NumLines; i++) {
    chromaticline(x1(t + i),y1(t + i),x2(t + i),y2(t+i));
  }
 
  t+= 0.2;
  
  noStroke();
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
   
    aberation = 82;
   
  
  }
  if (channel2instr != 0 )
  { 
        
  }
  if (channel3instr != 0 )
  { 
   
    t+= 0.7;
  }
  if (channel4instr != 0 )
  { 
 
    aberation = -sin((frameCount%91)/8)*9.1;
    opacity = 171;
    
  }
  else {
    t+= 0.2;
    aberation = 1.5;
    opacity = 100;
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

void chromaticline(float xpos, float ypos, float xpos1, float ypos1) { 
  
  strokeWeight(5);
  
  stroke(255,0,0,opacity);
  line(xpos-aberation+width/2,ypos-aberation+height/2,xpos1-aberation+width/2,ypos1-aberation+height/2);
  stroke(0,255,0,opacity);
  line(xpos+width/2,ypos+height/2,xpos1+width/2,ypos1+height/2);
  stroke(0,0,255,opacity);
  line(xpos+aberation+width/2,ypos+aberation+height/2,xpos1+aberation+width/2,ypos1+aberation+height/2);

}
