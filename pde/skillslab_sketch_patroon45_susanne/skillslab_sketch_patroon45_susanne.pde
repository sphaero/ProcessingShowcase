import procmod.*;
ModPlayer mplayer;
int beweging = 0;
int sound = 0;
int hand =0;

int blauw = (#2A2EE8);
int roze = #F0278B;

float angle = 0;
float a = 0.0;
float s = 0.0;
float c = cos(angle);

void setup(){
  size(720,480);
  background(0);
  mplayer = new ModPlayer(this, dataPath("patroon.mod"));
  mplayer.play();
}

void draw(){
  background(0); 
  slap(0,0,720,480);
  rect(0,0,(frameCount * beweging), (frameCount* sound));
  fill(255);
  objectjes(0,0);
 
}
  
void objectjes (int xPos, int yPos){
  pushMatrix();
  // hoe ver uit elkaar
  a = a +0.02;
  // hoe groot
  s = cos (a)*0.8;
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  fill(blauw);
  rect(width/2,height/2,150,200);
  fill(roze);
  ellipse(width/2,height/2,200,200);
  fill(blauw);
  rect(width/2,height/2,200,200);
  angle = angle +3.5;
  popMatrix();
}

void slap(int xPos, int yPos, int hoogte, int breedte){
 beginShape();
    for (int iter = hand; iter< 150; iter ++){
    fill(random(0,255),random(0,255),random (0,255));
      vertex (random(width),random(height));
      curveVertex (random(width),random(height));
      noStroke();
      vertex (random(width),random(height));

}
  endShape (CLOSE);
   
  }
  
  void modRowEvent( int channel, int instrument, int note )
{
  println(channel +":"+ instrument +":"+ note);
  if (channel == 0)
  {
   beweging = note*10;
   }
   else if (channel == 1)
   {
     sound = instrument * 6;
     
   }
   else if (channel == 3);
   {
   hand = channel *4;
   }
  }
