import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = 0;
int patternnr = 0;
int patternrow = 0;
int patternrowOld;
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

int xPosBoven = 0;
int yPosBoven = 0;
int xPosOnder = 0;
int yPosOnder = 480;

int xPosLinks = 0;
int yPosLinks = 0;
int xPosRechts = 720;
int yPosRechts = 0;


void setup() {
  size(720, 480);
  //frameRate(64);
  oscP5 = new OscP5(this, 6200);
  background(0);
}

void draw() {
  rectMode(CENTER);
  noFill();
  strokeWeight(11.25);

  println(channel1instr, channel1note, patternnr);

  if (patternnr == 2) {
    if (patternrow != patternrowOld) {
      if (channel1instr == 11) {
        if (channel1note == 180 || channel1note == 202 || channel1note == 214 || channel1note == 240) {
          stroke(0, 225, 102);
          line(xPosBoven, yPosBoven, xPosOnder, yPosOnder);
        }
        if (channel1note == 404) {
          stroke(224, 224, 224);
          line(xPosBoven, yPosBoven, xPosOnder, yPosOnder);
        }
        if (channel1note == 428) {
          stroke(255);
          line(xPosBoven, yPosBoven, xPosOnder, yPosOnder);
        }
        if (xPosBoven <= width+11) {
          xPosBoven += 19;
          xPosOnder += 19;
        }
        if (xPosBoven >= width+11) {
          background(0);
          xPosBoven = 0;
          xPosOnder = 0;
          yPosLinks = 0;
          yPosRechts = 0;
        }
      }
    }
  }

  patternrowOld = patternrow;

  //println(channel3note);

  //textAlign(CENTER);
  //text("PAT:" + patternnr, width/2, height/2);
}

void oscEvent(OscMessage message)
{
  if (message.checkAddrPattern("/patternevent" ) )
  {
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
      channel4note, channel4instr, channel4effect, channel4effect_param);
    //println( feedback_formatted );
  }
}
