//by Finn Gras

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


//spiral
int n = 100;
float size = 80;
float speed = 0.2 * PI;
float maxDistance = 30;
PVector[] chain = new PVector[n];

//stars
int m = 30;
float starSpeed = 0.1;
float[] angles = new float[m];
PVector[] stars = new PVector[m];


void setup()
{
  size(720, 480);
  background(0);
  
  oscP5 = new OscP5(this,6200);
  
  for(int i = 0; i < n; i++) {
    chain[i] = new PVector(width/2, height/2);
  }
  
  for(int i = 0; i < m; i++) {
    angles[i] = random(TAU); 
    float radius = random(1);
    float exponent = 3.4;
    stars[i] = new PVector(width * (0.5 + pow(radius, exponent) * cos(angles[i])), height * (0.5 + pow(radius, exponent) * sin(angles[i])));
  }
}

void draw() {
  if(patternrow % 16 == 0) {
    fill(255, 255, 255, 30);
  }
  else {
    fill(0, 0, 0, 30);
  }
  rect(-5, -5, width + 10, height + 10); 
  noStroke();
  
  chain[0].set(0.5 * width 
             //+ 0.25 * width * cos(frameCount * speed * 0.5)
             + 0.75 * width * sin(frameCount * speed * 0.25), 
               0.5 * height
             //+ 0.25 * height * sin(frameCount * speed * 0.5)
             + 0.75 * height * cos(frameCount * speed * 0.25));

  drawSpiral();
  
  drawStars();
}

void drawSpiral() {
  fill(255, 0, 0); 
  circle(chain[0].x, chain[0].y, size);
  
  for(int i = 1; i < n; i++) {
    float radius = 1 + (float)(n - i)/n * size;
    PVector difference = PVector.sub(chain[i], chain[i-1]);
    if(difference.mag() > maxDistance) {
      chain[i].set(PVector.add(chain[i-1], difference.setMag(maxDistance)));
    }
    
    fill(lerpColor(color(255, 0, 0), color(100, 0, 0), (float)i/n));
    circle(chain[i].x, chain[i].y, radius);
  }
}


void drawStars() {
  for(int i = 0; i < m; i++) {
    float oldX = stars[i].x;
    float oldY = stars[i].y;
    
    float distance = PVector.sub(stars[i], new PVector(width/2, height/2)).mag();
    stars[i].add(starSpeed * (distance + 1) * cos(angles[i]), starSpeed * (distance + 1) * sin(angles[i]));
    
    stroke(255, 255, 255);
    strokeWeight(1);
    line(oldX, oldY, stars[i].x, stars[i].y);
    
    if(distance > 0.5 * sqrt(width * width + height * height)) {
      stars[i].set(width/2, height/2);
      angles[i] = random(TAU);
    }
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
