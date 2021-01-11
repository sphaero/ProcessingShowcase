float y;
float x;
float t;
int blauwelijn_frames = 0;

import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;

void setup() {
  size(720,480);
  y = 480;
  x = 0;
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat56.mod"));
  //  play it rightaway
  mplayer.play();
  frameRate(30);
}

void draw() {
println(frameCount);
  
   if (frameCount > 120){
    background(0);
  }else if (frameCount < 60) {
   background(0);
  }else{
   background(0,250,0);
 }

  if (frameCount > 120){
  vierkantenAchtergrond(t);
  t = t + 1;
  }
  
  strokeWeight(20);
  strokeCap(SQUARE);
  
  if (blauwelijn_frames > 0){
   stroke(20,250,130);
   blauwelijn_frames = blauwelijn_frames - 1;
  }
   else{
   stroke(255,20,147);
   }  

   if (frameCount < 70){
   color c = g.strokeColor;
   stroke(red(c), green(c), blue(c), 150);
   }

  x = x + width/(frameRate*1.5);
for (int i = 0; i < 480; i = i+60) {
  line(0, i+25, x, i+25);
 }
 
   y = y - height/(frameRate*1.5);
 for (int j = 0; j < 770; j= j+60) {
  line(j, 480, j, y);
 } 

}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.

void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (note == 70 && frameCount < 200)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
  blauwelijn_frames = 10;
  }
}


void vierkantenAchtergrond(float t){
  float x = 18*cos(t/20);
  float y = 18*sin(t/20);
 
  noStroke();
  fill(0,250,0);
  rect(x+10, y+35, 35, 35);
  
  noStroke();
  fill(0,250,0);
  rect(x+70, y+35, 35, 35);
  
  for (int j = -25; j <= 455; j = j +60) {
    for (float k = 0; k < 720; k = k+60) {
      rect(x+k+10, y+j, 35, 35);
    }
  }
}
