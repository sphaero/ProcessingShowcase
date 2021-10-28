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

void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this,6200);
  mono = createFont("arcadeclassic.ttf", 12);
  textFont(mono);
}

void tekensun()
{
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*0.01%360);
  color c[] = {color(200,0,0), color(200)};
  for (int i=0;i<20;i++)
  {
    stroke(0);
    fill(c[i%2]);
    triangle(0,0,width,0,width,-100);
    rotate(-PI/9);
  }
  popMatrix();
  fill(0);
  rect(0,height/2, width, height);
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

String txts[] = {"HELP ME", "END ME"};
void draw() 
{
  if (patternrow == 0 )
  { 
    start = frameCount;
  }
  int count = frameCount - start;
  background(0);
  noStroke();
  pushMatrix();
  translate(-100+sin(frameCount*0.1)*100, -100+cos(frameCount*0.1)*100);
  //tekenGrid(71, mouseX);
  popMatrix();

  pushMatrix();
  translate(-100-sin(frameCount*0.1)*100, -100-cos(frameCount*0.1)*100);
  //tekenGrid(71, 10);
  popMatrix();

  //tekensun();
  pushMatrix();
  rotate(PI);
  translate(-width,-height);
  tekenbgbars();
  popMatrix();
  tekenbgbars();
  //tekenlijnen(startcount%height);

  if (patternrow > 24 && patternrow < 64)
  {
    pushMatrix();
    translate(width/2, height/2);
    println(count);
    scale(pow(0.1+(count-180)*0.008,2));
    textSize(180);
    textAlign(CENTER,CENTER);
    int txtposx = 0;
    int txtposy = -40;
    outlinetext(txts[1], txtposx, txtposy);
    //text(" END ME", txtposx, txtposy+52);
    popMatrix();
  }
  
  if (patternrow > 8 && patternrow < 40)
  {
    pushMatrix();
    translate(width/2, height/2);
    scale(pow(0.1+(count-60)*0.008,2));
    textSize(180);
    textAlign(CENTER,CENTER);
    int txtposx = 0;
    int txtposy = 10;
    outlinetext(txts[0], txtposx, txtposy);
    //text(" END ME", txtposx, txtposy+52);
    popMatrix();
  }
  
  /*if (patternnr == 0 )
  {
    noStroke();
    fill(0,255-patternrow*8);
    rect(0,0, width, height);
  }*/

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
