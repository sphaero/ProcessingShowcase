import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;
int rectding = 0;



void setup() {
 
  size(720,480);
  background(bgcolor);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt.mod"));
  //  play it rightaway
  mplayer.play();
  
  background(0,0,0);
}

void draw() {
    strokeWeight(2);
  stroke(#000000);
fill (0,255,0);
 strokeWeight(5);
 rect(0,100 +sin(frameCount*rectding)*640+100/50,720,20); 
 rect(0,200 +sin(frameCount*rectding)*640+100/50,720,20);
 rect(0,300 +sin(frameCount*rectding)*640+100/50,720,20);
 rect(0,400 +sin(frameCount*rectding)*640+100/50,720,20);
 rect(sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(100+sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(200+sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(300+sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(400+sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(500+sin(frameCount*rectding)*640+10/2,0,20,480);
 rect(600+sin(frameCount*rectding)*640+10/2,0,20,480);
 
 }

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 2)
  {
    rectding = note * 7;
  }
}


  
