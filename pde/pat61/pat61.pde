// Uitprobeersel Annelies

void modPatternEvent(int pos, int pattern)
{
   println(pos, pattern); 
}

import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color

color bgcolor0 = 0;
color bgcolor1 = 0;
int NUMBER_OF_LINES = 45;
float angle = TWO_PI/NUMBER_OF_LINES;
float RING_OF_LINESMidden = 0;
float RING_OF_LINES = 0;

void setup() {
  frameRate(30);
  size(720, 480);
  background(bgcolor1);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat61.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw(){
  DraaiendeCircle(); 
  }

void DraaiendeCircle() {
  background(bgcolor0);
  fill(255);

  //circle midden
  translate(width/2, height/2 );
  for (int i = 0; i < NUMBER_OF_LINES; i++) {
    pushMatrix();
    rotate(angle +i*TWO_PI/NUMBER_OF_LINES   );
    stroke(random(0,255),100,100);
    strokeWeight(2);
    fill(0);
    line(RING_OF_LINESMidden, RING_OF_LINESMidden, RING_OF_LINES+150, 0);  //RING_OF_LINES+150 maakt de lengte van de lijn
    popMatrix();
  }
  angle = angle+ 0.05;
  
// circle rechts
  translate(width/4, sin(frameCount*0.25)*70);
  for (int i = 0; i < NUMBER_OF_LINES; i++) {
    pushMatrix();
    rotate(angle +i*TWO_PI/NUMBER_OF_LINES   );
    stroke(100,random(0,255),random(0,100));
    strokeWeight(2);
    fill(0);
    line(RING_OF_LINESMidden, RING_OF_LINESMidden, RING_OF_LINES+100, 0);
    popMatrix();
  }
  
  //circle rechts2  
for (int i = 0; i < NUMBER_OF_LINES; i++) {
    pushMatrix();
    rotate(angle +i*TWO_PI/NUMBER_OF_LINES   );
    stroke(255,random(0,255),random(0,100));
    strokeWeight(2);
    fill(0);
    line(0, 0, RING_OF_LINES+100, 0);
    popMatrix();
}

//circle links1 (op en neer)
  translate(-width/2, 0);
  for (int i = 0; i < NUMBER_OF_LINES; i++) {
    pushMatrix();
    rotate(angle +i*TWO_PI/NUMBER_OF_LINES   );
    stroke(100,random(0,255),random(0,100));
    strokeWeight(2);
    fill(0);
    line(RING_OF_LINESMidden, RING_OF_LINESMidden, RING_OF_LINES+100, 0);
    popMatrix();
  }
  
for (int i = 0; i < NUMBER_OF_LINES; i++) {
    pushMatrix();
    rotate(angle +i*TWO_PI/NUMBER_OF_LINES   );
    stroke(255,random(0,255),random(0,100));
    strokeWeight(2);
    fill(0);
    line(0, 0, RING_OF_LINES+100, 0);
    popMatrix();
}
}

    //  This method is called every time an instrument is being played. 
    //  Note: It is also called when no instrument is being called on a channel
    //  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
    //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 0) {
    //  Whatever instrument is being played just set a background color from the note played.
   bgcolor0 = color(note,0,note * 3); // Maakt achtergrond blauw
  }
  
  else if (channel ==1) {
    bgcolor1 = color (0,0,note*4);
    RING_OF_LINES = RING_OF_LINES +20;
    RING_OF_LINESMidden = RING_OF_LINESMidden+15;
    
    if (RING_OF_LINES > 100){
      RING_OF_LINES = 20;
    }
    
    if (RING_OF_LINESMidden > 80){
      RING_OF_LINESMidden = 0;
    }
  }
  
  else if (channel ==2){
  
    
  }
  
}
