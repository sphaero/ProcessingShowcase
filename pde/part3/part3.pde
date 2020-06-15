import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
float beat = 0;

void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("part3.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  //background(0);

  float wave = sin(radians(frameCount));
  arc(0, 180 + wave * 180, width*20, height*400, 0, 200*PI);
  
   fill(random(200),255,0);
  //float wave2 = sin(radians(frameCount));
  //arc(0, 180 + wave * 180, width*beat, height*400, -200*PI / beat, 0);
  //rect(320 + wave * 300,0,20,500);
  //text("tekst", 40, 180);
  

  //stroke(255);
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
    beat = note * 50;
  }

}
