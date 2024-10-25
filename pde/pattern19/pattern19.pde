//Gemaakt door: Merel Creemers 


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

int x = 320;
int y = 345;
int horizon = 160;

PVector[] eindpunt = new PVector[3];
PVector[] eindpunt2 = new PVector[5];
PVector location = new PVector(x+30,y+80);
PVector location2 = new PVector(x+70,y+80);;
PVector velocity = new PVector(0,0);;
PVector velocity2 = new PVector(0,0);;
PVector acceleration;
PVector acceleration2;
PVector top;
PVector top2;
float topspeed = 5;
int counter;
int counter2;

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(0,168,243);
  stroke(9,134,190);  
  fill(9,134,190);
  rect(0,0,720,horizon-1);
  afbeelding_jet(x,y);
  strokeWeight(4);
  
  if(channel1note == 160){
  stroke(255,255,255);
  line(x+30,y+80, 20,horizon); 
  }
  if(channel1note == 180){
  stroke(255,0,255);
  line(x+30,y+80, 120,horizon); 
  }
  if(channel1note == 190){
   stroke(0,255,255);
   line(x+30,y+80, 220,horizon); 
  }
  
  if(channel1note == 214){
  stroke(255,0,0);
  line(x+70,y+80, 500,horizon); 
  }
  if(channel1note == 254){
  stroke(0,255,0);
  line(x+70,y+80, 600,horizon); 
  }
  if(channel1note == 381){
  stroke(255,255,0);
  line(x+70,y+80, 700,horizon); 
  } 
  
  if(channel2note == 285){
   counter = 0; 
  }
  if(channel2note == 269){
   counter = 1; 
  }
  if(channel2note == 226){
   counter = 2; 
  }  
  if(channel3note == 113){
   counter2 = 0; 
  }
  if(channel3note == 269){
   counter2 = 1; 
  }
  if(channel3note == 285){
   counter2 = 2; 
  }
  if(channel3note == 381){
   counter2 = 3; 
  }
  if(channel3note == 453){
   counter2 = 4; 
  }
  update();
  display();
}

void afbeelding_jet(int x, int y){
  stroke(0);
  strokeWeight(1);
  fill(178,178,178);
  triangle(x+0,y+100,x+50,y+75,x+101,y+100);
  fill(220,220,220);
  triangle(x+40,y+110,x+50,y+66,x+60,y+110);
  if(channel4instr!= 0){
  fill(255,0,0);
  }
  else{
   fill(255,141,0); 
  }
  ellipse(x+50,y+110,13,8);
}

 void update() {
    eindpunt[0] = new PVector(90,horizon);
    eindpunt[1] = new PVector(200,horizon);
    eindpunt[2] = new PVector(310,horizon);
    eindpunt2[0] = new PVector(340,horizon);
    eindpunt2[1] = new PVector(415,horizon);
    eindpunt2[2] = new PVector(490,horizon);
    eindpunt2[3] = new PVector(575,horizon);
    eindpunt2[4] = new PVector(640,horizon);
    
    
    PVector acceleration = PVector.sub(eindpunt[counter],location);
    PVector acceleration2 = PVector.sub(eindpunt2[counter2],location2);
    // Set magnitude of acceleration
    acceleration.setMag(0.2);
    acceleration2.setMag(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    velocity2.add(acceleration2);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    velocity2.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
    location2.add(velocity2);
    top = location.copy();
    top2 = location2.copy();
    top.add(velocity);
    top2.add(velocity2);
  }

  void display() {
    strokeWeight(4);
    stroke(217, 252, 219);
    line(location.x,location.y,top.x,top.y);
    stroke(217, 252, 250);
    line(location2.x,location2.y,top2.x,top2.y);
  }

//uitlezen van waardes
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
