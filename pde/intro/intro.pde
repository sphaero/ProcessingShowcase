import netP5.*;
import oscP5.*;
import java.io.*; 
import java.util.*;
String[] nicknames = {"sphaero", "Miss Carriage", "GlitchyCroissant", "Blue Lightning", "peter-pan", "Wall-e", "pigeonzz", "bookworm", "porcini", "Effigy", "Sini" };
ArrayList<String> nn = new ArrayList<String>(Arrays.asList(nicknames));
String nicktxt = "";

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

int count = 0;

void setup()
{
  size(720, 480);
  nicktxt = rnd_nicktxt(40);
  strokeWeight(0);
  oscP5 = new OscP5(this,6200);
  count = int(random(0,1000));
}

String rnd_nicktxt(int lines)
{
  String line = "";
  for (int l=0;l<lines;l++)
  {
    Collections.shuffle(nn); 
    for (int i=0;i<nn.size();i++)
    {
      line += nn.get(i);
      line += " - ";
    }
    line += "\n";
  }
  return line;
}

int barswidth = 1;
int barspadding = 4;
void hbars()
{
  fill(c1);
  for (int i=0;i<height;i+=barspadding)
  {
    rect(0,i,width,barswidth);
  }
}

void vbars()
{
  fill(c1);
  for (int i=0;i<width;i+=barspadding)
  {
    rect(i,0,barswidth,height);
  }
}

color c1 = color(255,0,0);
color c2 = color(0);
color c3 = color(255);

void draw()
{
  if (songposition == 0)
  {
    background(patternrow*(255/8));
    return;
  }
  if (songposition % 2 == 0)
  {
    c1 = color(255,0,0);
    c2 = color(0);
    c3 = color(255);
  }
  else
  {
    c2 = color(255,0,0);
    c1 = color(0);
    c3 = color(0);
  }
  background(c2);
  pushMatrix();
  translate(width/2, height/2);
  translate(sin(count*0.03)*300, cos(count*0.13)*63);
  rotate(sin(count*0.015)*0.5);
  scale(sin(count*0.01)*1.3+2.6);
  textAlign(CENTER, CENTER);
  fill(c3);
  text(nicktxt, 10,10);
  popMatrix();
  if (count % 200 < 100)
  {
    vbars();
  }
  else
  {
    hbars();
  }
  count++;
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
