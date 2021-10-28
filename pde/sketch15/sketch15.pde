import netP5.*;
import oscP5.*;

import netP5.*;
import oscP5.*;

float diameter; 
float angle = 0;

int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

int teller = 1;
int delta = 10;

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

void setup()
{
  size(720, 480);
  diameter = height - 5;
 
  
  oscP5 = new OscP5(this,6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
}

void draw()
{
  if (channel3instr == 4 )
  { 
    background(100);
  }
  else
  {
    background(0);
  }
  fill(0);
  rect(0,height-14,feedback_formatted.length()*8,14);
  fill(255);
  text(feedback_formatted, 2, height-2);
  weirdline1();
  weirdelipse();
  weirdline2();
  weirdrect();
}



void weirdelipse()
{  
  float d1 = 10 + (sin(angle) * diameter/-1) + diameter/20;
  float d2 = 10 + (sin(angle + PI/2) * diameter/-1) + diameter/20;
  float d3 = 10 + (sin(angle + PI) * diameter/-1) + diameter/20;
  
  noStroke();
  fill(210, 163, 76);
  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);
  
  angle += 0.06;
}

void weirdline1()
{
  noStroke();
  fill(255);
  teller = teller + delta;
  if ( teller > width) 
  {
    delta = -15;
  }
  if ( teller < 2 )
  {
    delta = 15;
  }
 int which = frameCount % num;
  mx[which] = teller*4;
  my[which] = 10;
  for (int i = 0; i < num; i++) 
  {
  int index = (which+1 + i) % num;
  ellipse(mx[index], 100, i, i);
  }
}

  
  void weirdline2()
{
  noStroke();
  fill(255);
  teller = teller + delta;
  if ( teller > width) 
  {
    delta = -15;
  }
  if ( teller < 2 )
  {
    delta = 15;
   }
  int which = frameCount % num;
  mx[which] = teller*4;
  my[which] = 10;
  for (int i = 0; i < num; i++) 
  {
  int index = (which+1 + i) % num;
  ellipse(mx[index], 300, i, i);
  }
}

void weirdrect()
{
  pushMatrix();
  fill(255);
  rect(teller, 20, 100, 100);
  fill(255);
  rect(550, teller, 100, 100);
  fill(0);
  rect(teller/0.5,190 ,100, 100);
  fill(0);
  rect(100, teller/0.5, 100, 100);
  teller = teller + delta;
  popMatrix();
  if ( teller > width ) 
  {
    delta = -10;
  }
  if ( teller < 0 )
  {
    delta = 10;
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
  }
}
