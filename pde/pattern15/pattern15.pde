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

color bg = #000000;
color fg = #ff0000;

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
}



void draw() 
{
  background(bg);
  fill (fg);
  noStroke();
  
   ellipse (360,240, 250, 210);
   ellipse (40,240, 250, 210);
   ellipse (680,240, 250, 210);
   

   
   
   
   fill (255,255,255);
 
   
   
 float tilesX = 4;
 float tilesY = tilesX;
 
 float tileW = width / tilesX;
 float tileH = height / tilesY;
 
 for (int x = 0; x < tilesX; x++){
  for (int y = 0; y < tilesY; y++){
    float posX = tileW * x;
    float posY = tileH * y;
    
    float wave = sin (radians(frameCount + x * 1200 + y * 330));
    float mappedWave = map (wave, -1,1,0,5);
    
    int selector = int(random(4));
    //int selector = int(mappedWave);
    
    pushMatrix ();
    translate (posX, posY);
    if (selector == 0) {
      arc (0,0, tileW*2, tileH*2, radians(0), radians (90));
    } else if (selector == 1){
      arc (tileW,0, tileW*2, tileH*2, radians(90), radians (180));
    } else if (selector == 2){
      arc (tileW,tileH, tileW*2, tileH*2, radians(180), radians (270));
    } else if (selector == 3){
      arc (0,tileH, tileW*2, tileH*2, radians(270), radians (360));
    } else {
      rect (0,0, tileW, tileH);
    }
  
 
 
   
    popMatrix ();
}
}


  
  textAlign(CENTER);
  //text("PAT:" + patternnr, width/2, height/2);
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
