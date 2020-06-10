import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;
int ellipseding = 0;
int rectding = 0;
int rectdingen = 0;


void setup() {
  size(640,360);
  background(bgcolor);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
 // background(bgcolor);
  strokeWeight(2);
  stroke(#000000);
 

 
  
 //int x = 0;
 //while (x < width) {
//    line(x, 0, x, height);
//    x = x + 20;
//  }
  
//  for (int y = 0; y < height; y = y + 20) {
//   line(0, y, width, y);
//  }
  
 fill (0,255,0);
  strokeWeight(2);
 rect(0,sin(frameCount*rectding)*640+10/2,640,20); 
 rect(sin(frameCount*rectding)*640+10/2,2,20,360);
 
  //fill (0,rectding,0);
 // strokeWeight(2);
 // rect(0,sin(frameCount*rectdingen)*100+280/2,420,20); 
 }


  
  


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 3)
  {
    rectding = note * 7;
  }
  
  if (channel == 3)
  {
    rectdingen = note * 10;
  
  }

  
  
  if (channel == 3)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 2;
   
  }


}


  
