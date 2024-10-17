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

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(0,168,243);
  afbeelding_jet(x,y);
  
  if(channel1note == 160){
  stroke(255,255,255);
  strokeWeight(4);
  line(x+30,y+80, 20,0); 
  }
  if(channel1note == 180){
  stroke(255,0,255);
  strokeWeight(4);
  line(x+30,y+80, 120,0); 
  }
  if(channel1note == 190){
   stroke(0,255,255);
   strokeWeight(4);
   line(x+30,y+80, 280,0); 
  }
  
  if(channel1note == 214){
  stroke(255,0,0);
  strokeWeight(4);
  line(x+70,y+80, 500,0); 
  }
  if(channel1note == 254){
  stroke(0,255,0);
  strokeWeight(4);
  line(x+70,y+80, 600,0); 
  }
  if(channel1note == 381){
  stroke(255,255,0);
  strokeWeight(4);
  line(x+70,y+80, 700,0); 
  }
  
  //noStroke();
  //int widthkwart = width/4;
  //if (channel1instr != 0 )
  //{ 
  //  fill(70, 35, 122);
  //  rect(0, 0,  widthkwart, height);  
  //  fill(255, 255, 0);
  //  rect(10,10, channel1note/3, channel1note/3);
  //}
  //if (channel2instr != 0 )
  //{ 
  //  fill(61, 220, 151);
  //  rect(width - widthkwart*3, 0,  widthkwart, height);  
  //  fill(255, 0, 255);
  //  rect(210,10, channel2note/3, channel2note/3);
  //}
  //if (channel3instr != 0 )
  //{ 
  //  fill(243, 167, 18);
  //  rect(width - widthkwart*2, 0,  widthkwart, height);    
  //  if(channel3instr == 13){
  //    fill(255, 255, 255);
  //    rect(400,10,channel3note/3, channel3note/3);
  //  }
  //  if(channel3instr == 14){
  //    fill(255, 10, 255);
  //    rect(400,110,channel3note/3, channel3note/3);
  //  }
  //  if(channel3instr == 15){
  //    fill(10, 255, 255);
  //    rect(400,210,channel3note/3, channel3note/3);
  //  }
  //}
  //if (channel4instr != 0 )
  //{ 
  //  fill(1, 186, 239);
  //  rect(width - widthkwart, 0, widthkwart, height);    
  //  if(channel4instr == 13){
  //    fill(255, 255, 255);
  //    rect(600,10,channel4note/3, channel4note/3);
  //  }
  //  if(channel4instr == 24){
  //    fill(10, 10, 255);
  //    rect(600,110,channel4note/3, channel4note/3);
  //  }
  //}
  
  //textAlign(CENTER);
  //textSize(32);
  //text("PAT:" + patternnr, width/2, height/2);
}

void afbeelding_jet(int x, int y){
  stroke(0);
  strokeWeight(1);
  fill(178,178,178);
  triangle(x+0,y+100,x+50,y+70,x+101,y+100);
  fill(220,220,220);
  triangle(x+40,y+110,x+50,y+46,x+60,y+110);
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
