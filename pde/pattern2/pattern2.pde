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

int siz = 72;

void setup() {
  size(720, 480);
  oscP5 = new OscP5(this, 6200);
  background(0);
}

void vierkant() {
  noStroke();
  square(siz/2+2, siz/2+2, siz);
}

void cirkel() {
  noStroke();
  circle(siz/2+2, siz/2+2, siz);
}

void driehoek() {
  noStroke();
  triangle(2, 72+2, 72+2, 72+2, 36+2, 2);
}

void kruis() {
  stroke(0, 225, 102);
  strokeWeight(8);
  line(2, 2, 72+2, 72+2);
  line(72+2, 2, 2, 72+2);
}

void draw() {
  rectMode(CENTER);
  fill(0, 225, 102);

  translate(0, 20);
  println(channel1instr, channel1note, channel3instr, patternnr);

  if (patternnr == 2) {
    if (patternrow != patternrowOld) {
      if (channel1instr == 11) {
        if (channel1note == 180 || channel1note == 202) {
          pushMatrix();
          translate(xPosBoven, 0);
          vierkant();
          popMatrix();
          if (xPosBoven <= width+20) {
            xPosBoven += 20+siz;
          }
        }
        if (channel1note == 214 || channel1note == 240) {
          pushMatrix();
          translate(xPosBoven, siz+20);
          cirkel();
          popMatrix();
          if (xPosBoven <= width+20) {
            xPosBoven += 20+siz;
          }
        }
        if (channel1note == 404) {
          pushMatrix();
          translate(xPosBoven, (siz+20)*2);
          driehoek();
          popMatrix();
          if (xPosBoven <= width+20) {
            xPosBoven += 20+siz;
          }
        }
        if (channel1note == 428) {
          pushMatrix();
          translate(xPosBoven, (siz+20)*3);
          kruis();
          popMatrix();
          if (xPosBoven <= width+20) {
            xPosBoven += 20+siz;
          }
        }
        if (channel4instr > 0) {
          pushMatrix();
          translate(xPosBoven, (siz+20)*4);
          noStroke();
          fill(224, 224, 224);
          circle(siz/2, siz/2, siz);
          popMatrix();
          if (xPosBoven <= width+20) {
            xPosBoven += 20+siz;
          }
        }
        //if (channel3instr == 12) {
        //  pushMatrix();
        //  strokeWeight(random(1, 20));
        //  translate(random(-width/2+50, width/2-50), random(-height/2+50, height/2-50));
        //  stroke(255);
        //  square(width/2, height/2, 60+random(-50, 50));
        //  popMatrix();
        //  if (xPosBoven <= width+20) {
        //    xPosBoven += 20+siz;
        //  }
        //}
        if (xPosBoven >= width+19) {
          background(0);
          xPosBoven = 0;
          xPosOnder = 0;
          yPosLinks = 0;
          yPosRechts = 0;
        }
      }
    }
  }
  //println(channel3note);

  //textAlign(CENTER);
  //text("PAT:" + patternnr, width/2, height/2);
  patternrowOld = patternrow;
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
