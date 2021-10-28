import netP5.*;
import oscP5.*;

OscP5 oscP5;

float t = 0;

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
  oscP5 = new OscP5(this,6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
}

void draw() 
{
  if (channel4instr != 0 )
  { 
    background(0);
  }
  else
  {
    background(0);
  }
  
  fill(0);
  rect(0,height-14,feedback_formatted.length()*8,14);
  fill(57, 255, 20);
  
  text(feedback_formatted, 2, height-2);
  translate (width /2, height / 2);
  beginShape();
  stroke(255);
  for (float theta = 0; theta <= 2 * PI; theta += 0.01){
    float rad = r(theta,
      cos(t /2 ) * 8, //a
      sin(t /0.1 ) * 5, //b
      10, //m
      cos(t/50) +0.5, //n1
      tan(t / PI) * 0.5 + 0.5, //n2
      cos(t * PI) * 0.5 + 0.5);  //n3
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }
  endShape();
  
  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / a), n3), -1.0 / n1);
}
