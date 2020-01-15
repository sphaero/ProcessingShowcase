float count = 0;    // globale variabele voor de strobe functie
int xpos = 0; 
int xspeed = 20;
int ypos = 0;
int yspeed = 50;
int ypos2 = height;
int xpos2 = width;
int size = 10;
int growth = 1;
PImage img;


void setup(){
  size(720,480);
  background(0,0,255);
  loadSounds(59,63);
  img = loadImage("goldfish.png");
  noStroke();
  
}

void strobe(int freq){
  count = count + 1;
  
if (count == 10){
    background(0,0,255);
  }
  if (count == 20){
    background(0);
  }
  if (count == 30){
    background(255,0,0);
  }
  if (count == 40){
    count = 0;
  }

}

  
void draw(){
  playSounds();
  strobe(40);
  
  size = size + growth;
  if (size >= 100){
    growth = growth * -1;
  }
  if (size <= 0){
    growth = growth * -1;
  }
  
  ypos = ypos + yspeed;
  if (ypos >= height) {
    yspeed = yspeed * -1;
    fill(int(random(255)),int(random(255)),int(random(255)));
  }
  if (ypos <= 0) {
    yspeed = yspeed * -1;
    fill(int(random(255)),int(random(255)),int(random(255)));
  }
  
  xpos = xpos + xspeed;
  if (xpos >= width) {
    xspeed = xspeed * -1;
    fill(int(random(255)),int(random(255)),int(random(255)));
  }
  if (xpos <= 0) {
    xspeed = xspeed * -1;
    fill(int(random(255)),int(random(255)),int(random(255)));
  }
  

  //vormen
  //ellipse(xpos,ypos,size,size);
  image(img,xpos,ypos,size,size);
  
  
}
