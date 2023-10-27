//opslaan als pattern11

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
float greenX, orangeX, whiteX;
float movementSpeed = 2;

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
  noStroke();
  greenX = random(width);
  orangeX = random(width);
  whiteX = random(width);
}

//achtergrond
void draw() 
{
  background(255);

//animatie
  //background(0);
  noStroke();
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
    fill(70, 35, 122);
    rect(0, 0,  widthkwart, height);    
  }
  if (channel2instr != 0 )
  { 
    fill(61, 220, 151);
    rect(width - widthkwart*3, 0,  widthkwart, height);    
  }
  if (channel3instr != 0 )
  { 
    fill(243, 167, 18);
    rect(width - widthkwart*2, 0,  widthkwart, height);    
  }
  if (channel4instr != 0 )
  { 
    fill(1, 186, 239);
    rect(width - widthkwart, 0, widthkwart, height);    
  }
 
   //textSize(32);
   //textAlign(CENTER);
   //text("TEST");
  
  // Green square
  fill(143, 247, 92, 150);
  rect(greenX, height / 2, 100, 100);
  greenX += random (-movementSpeed-10, movementSpeed+10);
  greenX = constrain(greenX, 0, width - 100);
  
  // purple square
  fill(155, 93, 229, 100);
  rect(orangeX, height / 2 - 175, 100, 100);
  orangeX += random(-movementSpeed-10, movementSpeed+10);
  orangeX = constrain(orangeX, 0, width - 100);
  
  // black square
  fill(0,0,0,150);
  rect(whiteX, height / 2 + 150, 200, 200);
  whiteX += random(-movementSpeed, movementSpeed);
  whiteX = constrain(whiteX, 0, width - 100);
  
  //textAlign(CENTER);
  //textSize(32);
  //text("PAT:" + patternnr, width/2, height/2);
}
