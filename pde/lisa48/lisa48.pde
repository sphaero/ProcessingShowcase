import procmod.*;

int totalPts = 300;
float steps = totalPts + 1;
int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

ModPlayer mplayer;

color ch1color;
color ch2color;
color ch3color;
color ch4color;



void setup() {
size(740,480); 
stroke(255);
mplayer = new ModPlayer(this, dataPath("tune5.mod"));
mplayer.play();
 noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}




void draw() {
background(#430638);


  float rand = 0;
  for  (int i = 1; i < steps; i++) {
    point( (width/steps) * i, (height/2) + random(-rand, rand) );
    rand += random(-5, 5);
     point( (width/steps) * i, (height/10) + random(-rand, rand) );
    rand += random(-5, 5);
     background(#430638);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  
  ellipse(xpos, ypos, rad, rad);
  fill (#2DF7E5);

 
  
}
    
   

  }






void modRowEvent( int channel, int instrument, int note )
{
println(channel +":"+ instrument +":"+ note);
if (channel == 0)
{
ch1color = color(channel*64, note * 8, instrument*64);
}
else if ( channel == 1 )
{
ch2color = color(instrument*64, channel*64, note * 8);
}
else if ( channel == 2 )
{
ch3color = color(channel*64, note * 8, instrument*64);
}
else if ( channel == 3 )
{
ch4color = color(0, instrument*64, note * 8);
}
}
