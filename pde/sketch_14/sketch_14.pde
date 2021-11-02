//Final sketch Jelte Benedictus, bijbehorende pattern is 14 :)
float[] x = new float [100];
float[] y= new float [100];
float[] speed = new float [100];

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

void setup()
{
  size (720, 480);
  background (0);
  stroke(255);
  noFill();
  smooth();
  noStroke();
  
   oscP5 = new OscP5(this,6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
  
  int i = 0;
  while(i < 100) {
  x[i] = random (0, width);
  y[i] = random (0,height);
  speed[i] = random (1, 5);
  i = i + 1;
  }
}

void draw () 
{
  background(0);
  stroke(0, 255, 0);
  frameRate (24);
  //Reageert op de muziek
  if (channel4instr != 0 )
  { 
   float distance_left = random(720);
   line(distance_left,0, distance_left,480);
   //lijnen??
  }
  else
  {
   stroke(255);
   line(0,random(480), 719,random (480));
   //andere lijnen whoo
   }
  
  fill(0);
  rect(0,height-14,feedback_formatted.length()*8,14);
  fill(255);
  
  text(feedback_formatted, 2, height-2);
  
  //planeet achtige iets
  fill(255, 255, 255);
   rect(sin(frameCount*0.03)*300+310, 
   cos(frameCount*0.03)*100+270, 30, 30, 110);
  
 
 int i = 0;
 while(i < 100) {
  point (x[i], y[i]);
  
  x[i] = x[i] - speed[i];
  if(x[i] < 0) {
    x[i] = width;
  }
  i = i + 1;
 }
   translate(width/2, height/2);
  beginShape();
  for (float theta = 0; theta <=2 * PI; theta += 0.1) {
    float rad = r(theta,
    310 / random(100.0), //a
    240/ random(100.0), //b
    0, //m
    5, //n1
    1, //n2
    1  //3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  
  endShape();
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta /4.0) / a), n2) + 
pow(abs(sin(m * theta /4.0) / b), n3), -1.0 / n1);

  
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
 //credits: Alexander Miller, Processing Tutorial: Creating Trippy Animations with the Superformula
 
