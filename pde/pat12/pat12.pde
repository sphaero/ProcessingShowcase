import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;

color [] colArray ={
  color(255, 255, 255), 
  color(200, 5, 20), 
  color(0, 120, 25), 
  color(15, 35, 250), 
  color(125, 235, 250), 
  color(240, 245, 15), 
  color(160, 60, 235), 
};

  int grid = 100;
int margin = 100;

void setup() {
  size(720,480);
  background(bgcolor);
  //  Load the supplied E4d7cYrmRhC1yposE0CL_tune1.mod file
  mplayer = new ModPlayer(this, dataPath("pat12.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(bgcolor);
  size (720,480);
  fill(0,0,255);
  vierkant ();
  
}

void vierkant (){
  
   stroke(255);

  float d = 280;

  for (int i = margin; i<=width-margin; i+= grid) {
    for (int j = margin; j<=height-margin; j+= grid) {
      
      int colArrayNum = (int)random(7);
      stroke(colArray[colArrayNum]);
        strokeWeight (3);
      for (int num=0; num<7; num++) {
        float x1 = -random(d);
        float y1 = -random(d);
        float x2 = random(d);
        float y2 = -random(d);
        float x3 = random(d);
        float y3 = random(d);
        float x4 = -random(d);
        float y4 = random(d);
        
          pushMatrix();
        translate (i, j);
        quad(x1, y1, x2, y2, x3, y3, x4, y4);
        popMatrix();
     
      }
    }
  }
  
}

void keyPressed() {
  if (key==' ') redraw();
}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note *0;
    
  }
}
