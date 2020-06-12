import procmod.*;


// een integer die voor ons bijhoudt wanneer de Go stem wordt afgespeeld
int go_played = 0;
int blauw = (#2A2EE8);
int roze = #F0278B;

int totalPts = 300;
float steps = totalPts + 1;

ModPlayer mplayer;
void setup() {
  size(720,480);
  background(0);
  mplayer = new ModPlayer(this, dataPath("patt5.mod"));
  mplayer.play();
 
}

boolean on=true;
void draw() {
  fill(0);
  if(frameCount% 14== 0) {
    if(on)
  fill(roze,80);
    else
  fill(blauw,80);
    on = !on;
  }
  
  rect(random(700),random(500),random(200),random(200));
  
  //2
}


 
 
