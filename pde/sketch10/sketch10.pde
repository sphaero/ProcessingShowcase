import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = 0; // song positie 1t/m 127
int patternnr = 0; // pos 1 = pattern 5 etc
int patternrow = 0; // 0 -> 63 zijn 64 regels die hij heletijd herhaalt
int channel1instr = 0; // instrument 1 of sample nummer op kanaal 1
int channel2instr = 0; // instrument 1 of sample nummer op kanaal 2
int channel3instr = 0; // instrument 1 of sample nummer op kanaal 3
int channel4instr = 0; // instrument 1 of sample nummer op kanaal 4
int channel1note = 0; // toonhoogte 
int channel2note = 0; // toonhoogte
int channel3note = 0; // toonhoogte 
int channel4note = 0; // toonhoogte
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


float XposC = 0;
float YposC = 0;
float XposC2 = 0;
float YposC2 = 0;

int R = 0;

int K = 255;
int T = 150;


color[] kleur1 = {
  color(K), 
  color(K-15), 
  color(K-30), 
  color(K-45), 
};

color[] kleur2 = {
  color(0, 0, T), 
  color(0, 0, T-30), 
  color(0, 0, T-30), 
  color(0, 0, T-30), 
};




void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this, 6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
  background(0);
}

void draw() 
{




  if (channel3instr != 0 )
  {
    pushMatrix();
    RECT();
    popMatrix();
  }

  if (channel3instr != 0 )
  { 

    Tao1();
  }

  if (channel2instr != 4 )
  {

    strokeWeight(2);
    noFill();
    stroke(0, 0, 150);
    line(width/2, height/2, 0, 0);
  }




  if (channel1instr !=0)
  {
  fill(255,255,255);
  rect(0,0,width,height);
  }
  
  noFill();


  noStroke();
  fill(0, 2);
  rect(0, 0, width, height);


  // fill(0);
  // rect(0, height-14, feedback_formatted.length()*8, 14);
  // fill(255);

  //text(feedback_formatted, 2, height-2);
}


void RECT() 
{
  translate((width/2), (height/2));
  strokeWeight(1);
  stroke(0, 0, 0);

  fill(kleur2[int(random(4))]);
  rotate(R);

  rect((0), (0), int(random(40,50)), int(random(40,50)));
}



void Tao1() {

  strokeWeight(1);
  stroke(0, 0, 0);

  R++;
  // println(XposC1(),YposC1());
  translate(350, 240);
  fill(kleur1[int(random(4))]);
  rotate(R);
  rect(XposC1(), YposC1(), int(random(50)), int(random(50)));
}


float XposC1() {
  return sin(frameCount * 0.03)*230;
}

float YposC1() {
  return cos(frameCount * 0.03)*230;
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
