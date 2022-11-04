import netP5.*;
import oscP5.*;

OscP5 oscP5;

int countY = 0;
int countX = 0;
int speedY = 4;
int speedX = 4;

int fillkleur = 0;

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
  noStroke();

  oscP5 = new OscP5(this, 6200);
}
void animatie()
{
  fill(255,255,255);
  ellipse(200,200,200,100);
  ellipse(550,200,200,100);
  pushMatrix();
  translate(patternrow*2-53,0);
  fill(255,0,0);
  
  ellipse(200,200,50,50);
  ellipse(550,200,50,50);
  popMatrix();
    
      if (frameCount %15 == 0){
  background(255,255,255);

 
  }

}
void draw()
{
  background(255,0,0);
  if (patternnr == 38) {
    animatie();
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
    channel4note = message.get(15).intValue();
    ;
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |",
      patternnr, patternrow,
      channel1note, channel1instr, channel1effect, channel1effect_param,
      channel2note, channel2instr, channel2effect, channel2effect_param,
      channel3note, channel3instr, channel3effect, channel3effect_param,
      channel4note, channel4instr, channel4effect, channel4effect_param
      );
    println( feedback_formatted );
  }
}
