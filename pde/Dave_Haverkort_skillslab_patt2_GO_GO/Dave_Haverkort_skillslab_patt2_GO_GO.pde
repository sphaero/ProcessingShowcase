import procmod.*;
PFont font;
PImage img;




//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;
int ellipseding = 0;
int rectding = 0;
int rectdingen = 0;



void setup() {
  
// Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);
  bgcolor = 0;
  ellipseding = 0;
  rectding = 0;
  rectdingen = 0;

  size(720,480);
  font = createFont("DrukXCondensed-Super.otf", 24);
  textFont(font);
  
  img = loadImage("gabber2.png");
  background(bgcolor);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt2.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  background(bgcolor);
  strokeWeight(2);
  stroke(#ffffff);
  
  int x = 0;
  while (x < width) {
    line(x, 0, x, height);
    x = x + 20;
  }
  
  for (int y = 0; y < height; y = y + 20) {
    line(0, y, width, y);
  
  }
  fill(0,0,0,0+rectding);
  stroke(255,255,255,0+rectding);
  strokeWeight(2);
  
  rect(0,sin(-rectding)*180+440/2, width,20); 
  rect(0,sin(rectding)*200+440/2, width,20); 

  rect(sin(-rectding)*200+0/2,0, 20,720); 
  rect(sin(-rectding)*200+720/2,0, 20,720); 
  rect(sin(rectding)*200+720/2,0, 20,720); 
  rect(sin(rectding)*200+1400/2,0, 20,720); 
  
  noStroke();
  fill(255,255,255,1000*bgcolor);
  rect(0,0,720,480);
  
  imageMode(CENTER);
  image(img,width/2,height/2,height,width);
  
  fill(255,255,255,1000*bgcolor);
  rect(0,0,720,480);
  
 
  tint(0,255,0,1000*bgcolor);
  
  
textAlign(CENTER);  
fill(0,0,0,1000*bgcolor);
textFont(font, 640);
text("GO GO", 360, 480);

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
  
  if (channel == 0)
  {
    rectdingen = note * 10;
  }
  
  
  
  //Background//
  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 2;
  }

}

  
