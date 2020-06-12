import procmod.*;
ModPlayer mplayer;
int totalPts = 600;
float diameter; 
float angle = 0;
float angle2 =0;
float angle3 =0;

int blauw = (#2A2EE8);
int roze = #F0278B;
  
void setup() {
  size(720, 480);
  stroke(255);
   mplayer = new ModPlayer(this, dataPath("patt5.mod"));
  mplayer.play();
  diameter = height - 10;
  noStroke();
}

void draw() {
  
  background(roze);
  
 fill(blauw);
  float d4 = 10 + (sin(angle + PI/2) * diameter/0.5) + diameter/0.5;
  ellipse(width/2, height/2, d4, d4);
  angle += 0.23;

 
  //links
  fill(roze);
  float d1 = 10 + (sin(angle2) * diameter/1) + diameter/1;
  ellipse(width/2, height/2, d1, d1);
  angle2+=0.23;

  //midden
  fill(blauw);
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  ellipse(width/2, height/2, d2, d2);
  angle += 0.23;
  
  fill(roze);
  float d3 = 10 + (sin(angle3 + PI) * diameter/2) + diameter/2;
  ellipse(width/2, height/2, d3, d3);
  angle3 += 0.23;
  
   
}
