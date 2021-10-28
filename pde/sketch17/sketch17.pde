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

float t = 0;
int teller = 1;
//float angleRotate = 0.0;

void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this, 6200);
  mono = createFont("Andale Mono", 12);
  //println(PFont.list());
  textFont(mono);
}

void superformula(int posX, int posY)

{
  beginShape();
  for (float theta = 0; theta <= 2 * PI; theta += 0.01)
  {
    float rad = r(theta, sin(channel2instr) * 0.005 + 3, cos(channel3note) * 1 + 1.5, 30, 0.5, sin(channel3note)* 1 + 1.5, cos(t) * 1 + 0.1);
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  endShape();

  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) 
{
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) +  
    pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}

void andereSuperformula(int posX, int posY)
{
  beginShape();
  for (float theta = 0; theta <= 2 * PI; theta += 0.01)
  {
    float rad = r(theta, sin(channel3note), cos(channel2instr) * 2 + 0, 15, 0.5, sin(channel2instr)* 1 + 300, cos(channel2instr) * 0.5 + 0.05);
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  endShape();

  t += 0.1;
}


void draw() 
{  
    background(0);
    pushMatrix();
    translate(width / 2, height / 2);
    fill(0);
    stroke(255, 125);
    strokeWeight(3);
    superformula(10, 10);
    popMatrix();


    pushMatrix();
    translate(width / 2, height / 2);
    scale(0.3);
    fill(57, 255, 20);
    stroke(57, 255, 20);
    strokeWeight(3);
    superformula(10, 10);
    popMatrix();

    pushMatrix();
    translate(width / 2, height / 2);
    fill(255, 165);
    stroke(0);
    strokeWeight(3);
    andereSuperformula(10, 10);
    popMatrix();

    teller = teller + 1;
    println(teller);

  fill(0);
  rect(0, height-14, feedback_formatted.length()*8, 14);
  fill(255);

  text(feedback_formatted, 2, height-2);
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

    println( feedback_formatted );
  }
}
