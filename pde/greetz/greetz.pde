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

int start = -1;

String nicks[] = {
"sphaero",
"huis_anubis_fangirl@hotmail.com",
"Eeeyytje",
"5guy",
"N00BAF",
"ewaja",
"Nelis",
"S~",
"Hyperion",
"Spirit_Mooipaard",
"zombiegurl666",
"dointime",
"stirring spatula",
"Dewonq",
"obi one kenobi two",
"monke",
"Rhea",
"CAPRA",
"mh",
"ғᴜɴᴋʏsǫᴜᴏɴᴋ",
"Thomessi10",
"Hot_kpk",
"MEC"
};
float[] speeds = new float[nicks.length];
float[] xposs = new float[nicks.length];
float[] yposs = new float[nicks.length];

void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this,6200);
  mono = createFont("alot-of-love.ttf", 24);
  textFont(mono);
  for (int i = 0;i<nicks.length;i++)
  {
    speeds[i] = random(0.5, 1.5);
    xposs[i] = random(-width*2,0);
    yposs[i] = random(64, height-48);
  }
}

void tekensun(float delta, float size)
{
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*0.01%360*delta);
  color c[] = {color(200,0,0), color(200)};
  for (int i=0;i<20;i++)
  {
    noStroke();//stroke(0);
    fill(c[i%2]);
    triangle(0,0,width,0,width,-size);
    rotate(-PI/9);
  }
  popMatrix();
}

void tekenlijnen(int progress)
{
  for (int i=0;i<21;i++)
  {
    stroke(196, patternrow*4);
    strokeWeight(1);
    fill(255);
    int ypos = int(random(20+progress/2)+progress/2);
    int step = width/20;
    int xpos = int(i*step+step/2+random(step/2)-step);
    //rect(xpos, 0, step, ypos);
    line(xpos, 0, xpos, ypos);
  }
}

void outlinetext(String txt, int txtposx, int txtposy)
{
  fill(0);
  for(int x = -1; x < 2; x++){
    text(txt, txtposx+x, txtposy);
    text(txt, txtposx, txtposy+x);
    //text(" END ME", txtposx+x, txtposy+52);
    //text(" END ME", txtposx, txtposy+52+x);
  }
  fill(255);
  text(txt, txtposx, txtposy);
}

void tekenbgbars()
{
  pushMatrix();
  translate(0,height/2);
  int step = height/20;
  int posdelta = int(frameCount*0.5) % step;
  for (int i=0;i<10;i+=2)
  {
    int posx = i*step+posdelta;
    int c = posx + 255/step/10;
    fill(c,0,0);
    rect(0,i*step+posdelta,width,step-2);    
  }
  for (int i=1;i<10;i+=2)
  {
    int posx = i*step+posdelta;
    int c = posx + 255/step/10;
    fill(c,0,0);
    rect(0,i*step+posdelta,width,step-2);    
  }
  popMatrix();
}

void draw() 
{
  background(0);
  pushMatrix();
  rotate(PI);
  translate(-width,-height);
  //tekenbgbars();
  popMatrix();
  //tekenbgbars();
  //tekenlijnen(startcount%height);
  tekensun(1.0, sin(millis()*0.001)*60+150);
  //tekensun(-1.1, 197);
  textAlign(LEFT);
  textSize(48);
  for (int i = 0;i<nicks.length;i++)
  {
    pushMatrix();
    scale(speeds[i]);
    outlinetext(nicks[i], (int(xposs[i] + millis() *0.1 * speeds[i]))%(width*2), int(yposs[i]));
    popMatrix();
    //outlinetext(nicks[i], int(frameCount-(sin(i*(2*PI/nicks.length))*300-300)),int(sin(i*(2*PI/nicks.length))*height/2+height/2));
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
