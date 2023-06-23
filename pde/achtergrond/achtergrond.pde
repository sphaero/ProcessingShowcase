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

int numRects = 20; // Number of rectangles
float[] rectX = new float[numRects]; // X positions of rectangles
float[] rectY = new float[numRects]; // Y positions of rectangles
float[] rectSpeed = new float[numRects]; // Speed of rectangles
float rectMinSize = 100; // Minimum size of rectangles
float rectMaxSize = 200; // Maximum size of rectangles
float rectAlpha = 50; // Alpha value of rectangles

void setup() {
  size(720, 480);
  noStroke();
  
  oscP5 = new OscP5(this,6200);
  
  // Initialize rectangles
  for (int i = 0; i < numRects; i++) {
    rectX[i] = random(width);
    rectY[i] = random(height);
    rectSpeed[i] = random(0.5, 2.5);
  }
}


color groen = #808000; //, (128, 128, 0)
color oranje = #FF7034; //, (255, 113, 52)
color yellow  = #FFDB58; //, (255, 219, 88)
color beige = #EBD7A8; //, (235, 215, 168)

color bgcolor = color(0);
color bgcolor2 = groen;
color bgcolor3 = yellow;

int bgmargins = 0; // max 31

void background_pulse()
{
  float sinv = sin(patternrow % 8 * (PI/8));
  color c1  = lerpColor(bgcolor, bgcolor2, sinv);
  sinv = sin(patternrow % 16 * (PI/8));
  color c2  = lerpColor(bgcolor, bgcolor3, sinv);
  drawBackground(c1, c2);
}

void background_strobe()
{
  color c1  = lerpColor(bgcolor, bgcolor2, patternrow % 8 / 8.);
  color c2  = lerpColor(bgcolor, bgcolor3, patternrow % 8 / 8.);
  fill(c2);
  rect(width/2, height/2, 20,20); 
  drawBackground(c1, c2);
}

int channel4instr_cache = 0;

void draw() {
  background(bgcolor);
  if (channel3effect == 'C' )
  {
    if ( channel3effect_param.equals("00") )
    {
      bgmargins = 0;
    }
    else
    {
      String hex = "0x" + channel3effect_param;
      bgmargins = Integer.decode(hex)/2;
    }
  }
  
  if (channel1effect == 'C' )
  {
    if ( channel1effect_param.equals("00") )
    {
      bgmargins = 32;
    }
    else
    {
      String hex = "0x" + channel3effect_param;
      bgmargins = 8;
    }
  }
  if (patternnr == 0)
  {
    bgmargins = 0;
    bgcolor3 = oranje;
  }
  else if (patternnr >= 1 && patternnr <= 3 )
  {
    bgcolor3 = yellow;
    background_pulse();
  }
  else if (patternnr >= 10 && patternnr <= 12)
  {
    bgcolor2 = oranje;
    bgcolor3 = groen;
    if (patternrow % 4 == 0)
    {
      drawLines(bgcolor2, bgcolor3);
    }
    else
    {
      background(bgcolor);
    }
  }
  else
  {
    background_strobe();
  }
  
  //println(channel4instr_cache, channel4effect, channel4effect_param);
  /*if (channel4instr != 0)
  {
    channel4instr_cache = channel4instr;
  }
  if (channel4effect == 'E' && channel4effect_param.equals("B1") )
  {
    //bgcolor++;// = 0;
  }
  if (channel4effect == 'C' && channel4effect_param.equals("00") )
  {
    channel4instr_cache = 0;
  }
  */
  
  
  /*if (channel4instr_cache == 5 )
  {
    //bgcolor = color(128, 128, 0);
    background_strobe();
  }
  else if (channel1instr == 3 )
  {
    //bgcolor = color(200);
    background_pulse();
  }
  /*else
  {
    //background(0);
  }*/
  /*// Update and display rectangles
  for (int i = 0; i < numRects; i++) {
    rectX[i] += rectSpeed[i];
    
    // Wrap around when rectangle reaches edge
    if (rectX[i] > width + rectMaxSize) {
      rectX[i] = -rectMaxSize;
    }
    
    // Draw rectangles
    fill(255, rectAlpha);
    rect(rectX[i], rectY[i], map(sin(frameCount * 0.01), -1, 1, rectMinSize, rectMaxSize), map(cos(frameCount * 0.01), -1, 1, rectMinSize, rectMaxSize));
  }*/
}

void drawBackground(color color1, color color4) {
  // Draw the gradient background
  push();
  background(0);
  noStroke();
  for (int i = 0; i < height; i+=32) {
    // Calculate the color for each row
    float colorValue = map(i, 0, height, 0, 1);
    color c = lerpColor(color1, color4, colorValue);

    // Set the fill color and draw a rectangle for each row
    fill(c);
    rect(0, i, width, 32-bgmargins);
  }
  pop();
}

void drawLines(color color3, color color2) {
  // Set the stroke weight
  strokeWeight(4);

  // Loop through the width of the canvas
  for (float x = 0; x < width; x += 10) {
    // Calculate the y-coordinate based on the sine function and the frameCount
    float y = height / 2 + sin(x * 0.01 + frameCount/10.) * 100;

    // Set the stroke color based on the y-coordinate
    float colorValue = map(y, height / 2 - 100, height / 2 + 100, 0, 1);
    color c = lerpColor(color3, color2, colorValue);
    stroke(c);

    // Draw a line from the top to the y-coordinate
    line(x, 0, x, y);
    y = height / 3 + cos(x * -0.014 + frameCount/10.) * 100;
    line(x+5, height, x+5, height-y);

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
