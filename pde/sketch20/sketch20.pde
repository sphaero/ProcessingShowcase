import netP5.*;
import oscP5.*;

OscP5 oscP5;
float speed;
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
PFont mono;

void setup()
{
     size(720, 480);
  background(0);
  noStroke();
  oscP5 = new OscP5(this,6300);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
}

void draw() 
{
  
  
 
    fill(0,10);
  rect(0,0,width,height);
  fill(57,255,20);
  ellipse(10, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(110, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(210, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(310, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(410, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(510, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(610, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(710, -sin(frameCount*speed)*240+240, 100, 100);
 
  fill(57,255,20);
  rect(-sin(frameCount*speed)*360+360, 10, 50,10);
  rect(sin(frameCount*speed)*360+360, 60, 50,10);
  rect(-sin(frameCount*speed)*360+360, 110, 50,10);
  rect(sin(frameCount*speed)*360+360, 160, 50,10);
  rect(-sin(frameCount*speed)*360+360, 210, 50,10);
  rect(sin(frameCount*speed)*360+360, 260, 50,10);
  rect(-sin(frameCount*speed)*360+360, 310, 50,10);
  rect(sin(frameCount*speed)*360+360, 360, 50,10);
  rect(-sin(frameCount*speed)*360+360, 410, 50,10);
  rect(sin(frameCount*speed)*360+360, 460, 50,10);
 
 if (channel1instr != 5 || channel2instr != 7 )
  { 
    speed = 0.15;
  }
  else
  {
    speed = 0.5;
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
