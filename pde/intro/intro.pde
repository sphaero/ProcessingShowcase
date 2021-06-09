String[] nicknames = {"Sphaero", "@kerktoren", "Rambo","Amber","Lance\nHardwood","maren","Vincent\nSpiering","Smeerlov\nIce", "Pikante\nHummus","Amy","Sam", "untergeshoven\nkinderke"};
// kleuren uit het palette in een array (arrays hebben we niet behandeld!)
color colors[] = { color(70, 35, 122), color(61, 220, 151), color(243, 167, 18), color(1, 186, 239), color(255, 0, 127) };
int index = 0;   // index om een kleur te kiezen
int counter = 0; // counter om frames te tellen voor animatie

// variablelen voor de OSC data uit gazebosc
import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = -1;
int patternnr = -1;
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

float scaleoffset = -3/8.;

void setup() {
  size(720, 480);
  noStroke();
  oscP5 = new OscP5(this,6200);
  mono = createFont("Retroville NC.ttf", 20);
  textFont(mono);
  counter = 0;
  scaleoffset = 0.;
}

void draw() {
  background(colors[0]); //paarse achtergrond
  if (songposition == -1) return;
  else if ( patternnr == 0 )
  {
    if ( channel2note == 214  && channel2instr == 3 || channel2instr == 2 ) // wissel van nickname als instrument 2 of 3 gespeeld wordt op kanaal 2 of 3
    {
      scaleoffset = patternrow * 1/16.;
    }
    pushMatrix();
     translate(width/2, height/2); // zet 0,0 coordinaten naar het midden van het scherm
     scale(patternrow *0.05 + scaleoffset);          // scale op basis van de counter (zoom effect)
     fill(colors[2]);              // roze kleur
     textAlign(CENTER, CENTER);            // text align in het midden
     text("DOPE", 0, -20); // teken tekst
     text("ON THE", 0, -2); // teken tekst
     text("TOILET", 0, 16); // teken tekst
    popMatrix();  
  }
  else if ( patternnr == 25 ) // op pattern 25 toon random cirkels met een random keuze van de kleuren
  {
    background(colors[0]); //paarse achtergrond
    translate(-width/2, -height/2);
    for (int i=0; i< 12; i++)
    {
      int colorindex = int(random(1,4));
      float diameter = random(200,700);
      fill(colors[colorindex]);
      int xpos = int(random(-100,width*2));
      int ypos = int(random(-100,height*2));
      rect(xpos, ypos, diameter, diameter);
    }
  }
  else 
  {
    if ( channel2note == 214  && channel2instr == 3 || channel2instr == 2 ) // wissel van nickname als instrument 2 of 3 gespeeld wordt op kanaal 2 of 3
    {
      index++;
      index = index % nicknames.length;
      channel2instr = 0;
      counter = 0;
    }
    pushMatrix();
     translate(width/2, height/2); // zet 0,0 coordinaten naar het midden van het scherm
     scale(counter *0.10);          // scale op basis van de counter (zoom effect)
     fill(colors[4]);              // roze kleur
     textAlign(CENTER, CENTER);            // text align in het midden
     text(nicknames[index], 0, -2); // teken tekst
    popMatrix();
  }
  counter++; // de counter verhogen!
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
