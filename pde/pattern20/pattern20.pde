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

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(255 );
  noStroke();
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
    fill(0);
  //  rect(0, 0,  widthkwart, height);    
  }
  if (channel2instr != 0 )
  { 
  rect(180, 65, channel2note , channel2note );
  rect(180 , 65 , channel2note, channel2note);
  rect(180 , 65, channel2note, channel2note);
  rect(180 , 65 , channel2note , channel2note);  
  fill (255, 0, 0);
  blendMode(DIFFERENCE);
  
  rect(180 +channel2note , 65 + channel2note, channel2note , channel2note );
  rect(180 +channel2note, 65 + channel2note, channel2note, channel2note );
  rect(180 +channel2note, 65 +channel2note, channel2note, channel2note);
  rect(180 +channel2note, 65 + channel2note, channel2note, channel2note);
  rect(180 +channel2note, 65 + channel2note, channel2note , channel2note);  
  fill (255, 0, 100);
  blendMode(DIFFERENCE);
  
  rect(130 +channel2note , 30 + channel2note, channel2note , channel2note );
  rect(130 +channel2note, 30 + channel2note, channel2note, channel2note );
  rect(130 +channel2note, 30 +channel2note, channel2note, channel2note);
  rect(130 +channel2note, 30 + channel2note, channel2note, channel2note);
  rect(130 +channel2note, 30 + channel2note, channel2note , channel2note);  
  fill (255, 0, 50);
  blendMode(DIFFERENCE);
    
    
    //ellipses
    
    
  ellipse(10, 10, channel2note/ 10, channel2note/ 10);
  ellipse(10 - 50, 10 - 50, channel2note / 10, channel2note/ 10);
  ellipse(10 - 100, 10 - 100, channel2note / 10, channel2note/ 10 );
  ellipse(10 - 150, 10 - 150, channel2note / 10, channel2note / 10);
  ellipse(10 - 200, 10 - 200, channel2note / 10, channel2note / 10);
  fill (255);
  blendMode(DIFFERENCE); 
    
  ellipse(500, 500, channel2note, channel2note);
  ellipse(500 - 50, 500 - 50, channel2note , channel2note);
  ellipse(500 - 100, 500 - 100, channel2note , channel2note );
  ellipse(500 - 150, 500 - 150, channel2note , channel2note );
  ellipse(500 - 200, 500 - 200, channel2note , channel2note );
  fill (100, 100, 100);
  blendMode(DIFFERENCE);
  
  ellipse(500, 500, channel3note, channel3note);
  ellipse(500 - 50, 500 - 50, channel3note -50, channel3note -50);
  ellipse(500 - 100, 500 - 100, channel3note -100, channel3note -100);
  ellipse(500 - 150, 500 - 150, channel3note -150, channel3note -150);
  ellipse(500 - 200, 500 - 200, channel3note -200 , channel3note -200);
  fill (0, 0, 0);
  blendMode(DIFFERENCE);
  
  ellipse(450, 500, channel3note + 50, channel3note + 50);
  ellipse(450 + channel2note, 450 + channel2note, channel3note -100, channel3note - 100);
  ellipse(450 + channel2note, 450 + channel2note, channel3note - 150, channel3note - 150);
  ellipse(450 + channel2note, 450 + channel2note, channel3note - 200, channel3note - 200);
  ellipse(450 + channel2note,450 + channel2note, channel3note - 250, channel3note - 250);
  fill (255, channel3note - 100, channel4instr);
  blendMode(DIFFERENCE);
   // rect(width - widthkwart*3, 0,  widthkwart, channel2note);
  }
  if (channel3instr != 0 )
  { 
  stroke(0, channel3note, channel2note + 100); 
  strokeWeight(channel2note / 1 + 10); 
 
  ellipse(1000, 1000, channel3note , channel3note);
  ellipse(1000 - 50, 1000 - 50, channel3note, channel3note );
  ellipse(1000 - 100, 1000 - 100, channel3note , channel3note);
  ellipse(1000 - 150, 1000 - 150, channel3note, channel3note );
  ellipse(1000 - 200, 1000 - 200, channel3note , channel3note);  
  fill (200, channel1note, 100);
  blendMode(DIFFERENCE);
  
  ellipse(1000 - 200, 1000 - 200, channel3note , channel3note);
  ellipse(1000 - 250, 1000 - 250, channel3note, channel3note );
  ellipse(1000 - 300, 1000 - 300, channel3note , channel3note);
  ellipse(1000 - 350, 1000 - 350, channel3note, channel3note );
  ellipse(1000 - 400, 1000 - 400, channel3note , channel3note);  
  fill (200, channel1note, 100);
  blendMode(DIFFERENCE);
}
  if (channel4instr != 0 )
  { 
  rect(360, 180, channel4note , channel4note );
  rect(360 , 180 , channel4note, channel4note );
  rect(360 , 180 , channel4note, channel4note);
  rect(360 , 180, channel4note, channel4note);
  rect(360 , 180 , channel4note , channel4note);  
  fill (255, 0, 0);
  blendMode(DIFFERENCE);
  
  rect(360 +channel4note , 130 + channel4note, channel4note , channel4note );
  rect(360 +channel4note, 130 + channel4note, channel4note, channel4note );
  rect(360 +channel4note, 130 +channel4note, channel4note, channel4note);
  rect(360 +channel4note, 130 + channel4note, channel4note, channel4note);
  rect(360 +channel4note, 130 + channel4note, channel4note , channel4note);  
  fill (255, 0, 100);
  blendMode(DIFFERENCE);
  
  rect(260 +channel4note , 30 + channel4note, channel4note , channel4note );
  rect(260 +channel4note, 30 + channel4note, channel4note, channel4note );
  rect(260 +channel4note, 30 +channel4note, channel4note, channel4note);
  rect(260 +channel4note, 30 + channel4note, channel4note, channel4note);
  rect(260 +channel4note, 30 + channel4note, channel4note , channel4note);  
  fill (255, 0, 50);
  blendMode(DIFFERENCE);
  
  
    //fill(1, 186, 239);
    //rect(width - widthkwart, 0, widthkwart, height);    
  }
  
  //textAlign(CENTER);
  //textSize(32);
  //text("PAT:" + patternnr, width/2, height/2);
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
