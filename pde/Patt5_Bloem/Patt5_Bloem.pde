import procmod.*;
ModPlayer mplayer;

int blauw = (#2A2EE8);
int roze = #F0278B;

float angle = 0;
float a = 0.0;
float s = 0.0;
float c = cos(angle);

void setup() {
   size(720, 480);
   mplayer = new ModPlayer(this, dataPath("patt5.mod"));
   mplayer.play();    
}

void draw() {
  // hoe ver uit elkaar
  a = a +0.02;
  // hoe groot
  s = cos (a)*0.8;
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  fill(blauw);
  rect(width/2,height/2,50,50);
  fill(roze);
  ellipse(width/2,height/2,50,50);
  fill(blauw);
  rect(width/2,height/2,50,50);
  angle = angle +3.5;
  popMatrix(); 
}
