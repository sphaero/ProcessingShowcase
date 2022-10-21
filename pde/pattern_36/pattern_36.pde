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
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(0);
  fill (0,255,0);
  
  if (patternrow % 10 == 0) 
  {
  background (255,255,255);
    fill (255,0,0);
   
     circle (60, 40,40);
     circle (160,40,40);
     circle (260,40,40);
     circle (360,40,40);
     circle (460,40,40); 
     circle (560,40,40);
      circle (660,40,40);
      
     circle (60, 140,40);
     circle (160,140,40);
     circle (260,140,40);
     circle (360,140,40);
     circle (460,140,40); 
     circle (560,140,40);
     circle (660,140,40);
     
     circle (60, 240,40);
     circle (160,240,40);
     circle (260,240,40);
     circle (360,240,40);
     circle (460,240,40); 
     circle (560,240,40);
     circle (660,240,40);

     circle (60, 340,40);
     circle (160,340,40);
     circle (260,340,40);
     circle (360,340,40);
     circle (460,340,40); 
     circle (560,340,40);
     circle (660,340,40);

     circle (60, 440,40);
     circle (160,440,40);
     circle (260,440,40);
     circle (360,440,40);
     circle (460,440,40); 
     circle (560,440,40);
     circle (660,440,40);
   
  }
  
   if (patternrow % 2 == 0) 
  {
    background (255,0,0);
    fill (0,0,0);
     circle (60, 40,60);
     circle (160,40,60);
     circle (260,40,60);
     circle (360,40,60);
     circle (460,40,60); 
     circle (560,40,60);
      circle (660,40,60);
      
     circle (60, 140,60);
     circle (160,140,60);
     circle (260,140,60);
     circle (360,140,60);
     circle (460,140,60); 
     circle (560,140,60);
     circle (660,140,60);
    
     circle (60, 240,60);
     circle (160,240,60);
     circle (260,240,60);
     circle (360,240,60);
     circle (460,240,60); 
     circle (560,240,60);
     circle (660,240,60);

     circle (60, 340,60);
     circle (160,340,60);
     circle (260,340,60);
     circle (360,340,60);
     circle (460,340,60); 
     circle (560,340,60);
     circle (660,340,60);

     circle (60, 440,60);
     circle (160,440,60);
     circle (260,440,60);
     circle (360,440,60);
     circle (460,440,60); 
     circle (560,440,60);
     circle (660,440,60);
  }
  
   if (patternrow % 30 == 0) 
  {
    background (255,0,0);
    fill (255,255,255);
    circle (360,240,60);
    circle (360,140,60);
    circle (360,340,60);
   
  }
    if (patternrow % 30 == 0) 
  {
    background (255,0,0);
    fill (255,255,255);
   
     circle (60, 40,20);
     circle (160,40,20);
     circle (260,40,20);
     circle (360,40,20);
     circle (460,40,20); 
     circle (560,40,20);
      circle (660,40,20);
      
     circle (60, 140,20);
     circle (160,140,20);
     circle (260,140,20);
     circle (360,140,20);
     circle (460,140,20); 
     circle (560,140,20);
     circle (660,140,20);
     
     circle (60, 240,20);
     circle (160,240,20);
     circle (260,240,20);
     circle (360,240,20);
     circle (460,240,20); 
     circle (560,240,20);
     circle (660,240,20);

     circle (60, 340,20);
     circle (160,340,20);
     circle (260,340,20);
     circle (360,340,20);
     circle (460,340,20); 
     circle (560,340,20);
     circle (660,340,20);

     circle (60, 440,20);
     circle (160,440,20);
     circle (260,440,20);
     circle (360,440,20);
     circle (460,440,20); 
     circle (560,440,20);
     circle (660,440,20);
   
  }
  
  //textAlign(CENTER);
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
