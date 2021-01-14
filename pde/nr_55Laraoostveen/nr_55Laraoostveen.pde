import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
int draw_for_frame_count = 200;
int sample_played = 1;
int dim;

void setup() {
  size(640, 360);
  dim = width/2;
  background(0);
   mplayer = new ModPlayer(this, dataPath("pat55.mod"));
  //  play it rightaway
  mplayer.play();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}

//gebaseerd op https://processing.org/examples/radialgradient.html
void draw() {
  background(#F78920);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(1, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 40, 95);
    ellipse(x, y, r, h);
    ellipse(x, y, r, r);
    ellipse(x, y, 30, 30);
    
    fill(255);
    stroke(x,y,r,r); 
    h = (h + 1) % 260;
 
  
  }

 
}
