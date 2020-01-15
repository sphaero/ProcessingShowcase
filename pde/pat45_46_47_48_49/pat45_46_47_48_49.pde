float count = 0;    // globale variabele voor de strobe functie
int xpos = 0; 
int xspeed = 10;


int xposs = 640; //x positie voor de opposite cirkel

int ypos = 0;     // globale variabele voor de y positie van de cirkel (ellips)
int yspeed = 10;  // globale variabele voor de snelheid van de cirkel 

int sq_size = 20;  //size vierkantjes
int xepos, yepos;  //posities vierkantjes

float r = 255;  //kleur rood
float g = 255;  //kleur groen
float b = 255;  //kleur blauw


void setup() {
  size(640,360);
  loadSounds(42,48);
}

void strobe(int freq) 
{
count = count + 0.2;
if (count == freq){
  fill(255);
  ellipse(width/2,height/2,50,50);
}

}

void draw() 
{
 playSounds();
  
  strobe(5);
 float teller = 1;
  while (teller<=1000) {
    xepos = int(random(0, width));
    yepos = int(random(0, height));
    fill(int(random(0,r)), int(random(0,g)), int(random(0,b)));
    rect(xepos, yepos, sq_size, sq_size);
    teller = teller+1;
    stroke(255);
    strokeWeight(2);
   
  }
  
  count = count + 1;
if (count >= 10){
  fill(255);
  ellipse(width/2,height/2,100,100);
}
if (count >= 30){
  fill(0);
  ellipse(width/2,height/2, 90,90);
}
if (count >= 50){
  fill(255);
  ellipse(width/2, height/2, 80,80);
}
if (count >= 70){
  fill(0);
  ellipse(width/2, height/2, 70,70);
}
if (count >= 90){
  fill(255);
  ellipse(width/2, height/2, 60,60);
if (count >= 110){
  fill(0);
  ellipse(width/2, height/2, 50,50);
}
if (count >= 130){
  fill(255);
  ellipse(width/2, height/2, 40,40);
}
if (count >= 150){
  fill(0);
  ellipse(width/2, height/2, 30,30);
}

if (count >= 200){
  xepos = int(random(0, width));
    yepos = int(random(0, height));
    fill(255);
    ellipse(xepos, yepos, 50,50);
    teller = teller + 0.2;
    stroke(255);
    strokeWeight(2);
}

xpos = xpos + xspeed;
if (xpos >= height)
{
  xspeed = xspeed * -1;
}
if (xpos <= 0)
{
  xspeed = xspeed * -1;
}
  xposs = xposs - xspeed;
  if (xposs >= height)
  {
    xspeed = xspeed;
  }
  if (xposs >= 640)
  {
    xspeed = xspeed;
  }
  
    

  ypos = ypos + yspeed;
  if (ypos >= height )
  {
    yspeed = yspeed * -1;
  }
  if (ypos <= 0)
  {
    yspeed = yspeed * -1;
  }
  
  noFill();
  stroke(255);
  strokeWeight(5);
  ellipse(xpos, height/2, 50,50);
  ellipse(width/2, ypos, 50,50);
  ellipse(xposs, height/2, 50, 50);
  
  r = r - 0.2;
  g = g - 0.5;
  b = b - 2;
}    
}
