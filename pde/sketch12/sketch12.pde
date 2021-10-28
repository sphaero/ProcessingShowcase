//Pattern 12

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
PFont mono;
float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m* theta / 4.0) / a), n2) +  
    pow(abs(sin(m* theta / 4.0) / b), n3), -1.0 / n1);
}

void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this, 6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
}

float t = 0;

void draw() 
{
  //algemene info
  translate(width/2, height/2);  
  noFill();
  strokeWeight(2);


  //bg white, black stripes, green base 
  if (channel2instr !=0) {
    //black stripes
    pushMatrix();
    background(255);
    stroke(0);
    beginShape();

    for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
      float rad = r(theta, 
        (cos(frameCount*0.13)*5), //a
        14, //b
        2*t, //m
        1, //n1
        1, //n2
        1 //n3
        );
      float x= rad * cos(theta) * 50;
      float y = rad * sin(theta) * 50;
      vertex(x, y);
    }

    endShape();
    popMatrix();

    //green base
    pushMatrix();
    stroke(170, 255, 0);
    beginShape();

    for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
      float rad = r(theta, 
        (cos(frameCount*0.068)*5), //a
        10, //b
        20*t, //m
        1.3, //n1
        0.7, //n2
        1 //n3
        );
      float x= rad * cos(theta) * 50;
      float y = rad * sin(theta) * 50;
      vertex(x, y);
    }

    endShape();
    popMatrix();
  }


  //bg black, green stripes, white base
  else {
    background(0);

    //green stripes
    pushMatrix();
    stroke(170, 255, 0);
    beginShape();

    for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
      float rad = r(theta, 
        (cos(frameCount*0.13)*5), //a
        10*t, //b
        2*t, //m
        1, //n1
        1, //n2
        1 //n3
        );
      float x= rad * cos(theta) * 50;
      float y = rad * sin(theta) * 50;
      vertex(x, y);
    }
    endShape();
    popMatrix();

    //white base
    pushMatrix();
    stroke(255);
    beginShape();

    for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
      float rad = r(theta, 
        (cos(frameCount*0.068)*5), //a
        10, //b
        20*t, //m
        1.3, //n1
        0.7, //n2
        1 //n3
        );
      float x= rad * cos(theta) * 50;
      float y = rad * sin(theta) * 50;
      vertex(x, y);
    }
    endShape();
    popMatrix();
  }

  fill(255);
  rect(0, height-14, feedback_formatted.length()*8, 14);
  fill(0);

  text(feedback_formatted, 2, height-2);

  t += 0.1;
  if (t>37){
    t=0;
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
