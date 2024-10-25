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
int samplePlayed = 0;
String[] nicknames = {
        "sphaero",
        "bibs",
        "IK",
        "Naadkat",
        "Kaakje katkit",
        "Stokvis",
        "Meerlol",
        "Copper",
        "AC",
        "Venno",
        "Bolt",
        "ThipixZ",
        "Fleydz"
      };
      
void setup() 
{
  size(720,480, P2D);
  f = createFont("Amiga-Regular.ttf", 48);
  oscP5 = new OscP5(this,6200);
  //textAlign(CENTER);
  samplePlayed = 0;
}

void draw() {
  if (channel2instr == 5)
  {
    samplePlayed = frameCount;
  }
  float r = (-cos(frameCount*0.01)*127+127)*0.7;
  float rb = r*0.7;
  //println(rb);
  float g = (-cos(frameCount*0.005)*127+127)*0.7;
  float gb = g*0.7;
  background(rb, gb,0);
  if (samplePlayed > 0 && frameCount % 5 > 2)
  {
    background(255);
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*0.01);
  for (int i=0;i<30;i++)
  {
    rotate(0.1*sin(frameCount*0.01));

    rectMode(CENTER);
    noFill();
    strokeWeight(1);
    stroke((i+frameCount*0.1)*19%255, 96);
    rect(0, 0, i*25, i*25);
    rect(1, 1, i*25, i*25);
    rect(-1, -1, i*25, i*25);
  }
  popMatrix();
  
  textFont(f);
  textSize(48);
  textAlign(CENTER);
  translate(width/2, height/2);
  fill(200,r,g);
  float cirkelsectie=6.28/nicknames.length;
  for (int i=0; i<nicknames.length;i++)
  {
    float circlepos = cirkelsectie*i+(frameCount*0.01);
    float radius = min(frameCount*10,190);
    text(nicknames[i], sin(circlepos)*radius, cos(circlepos)*radius);
  }  
  if (samplePlayed > 0)
  {
      textSize(148);
      textAlign(CENTER);
      text("LIMITLESS", 0, 20);
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
    println( feedback_formatted );
  }
}
