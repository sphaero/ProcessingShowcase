import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
int draw_for_frame_count = 200;
int sample_played = 1;
int dim;

void setup() {
  size(720, 480);
  dim = height/6;
  
   mplayer = new ModPlayer(this, dataPath("pat32.mod"));
  //  play it rightaway
  mplayer.play();
  colorMode(HSB, 760, 300, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}

//gebaseerd op https://processing.org/examples/radialgradient.html
void draw() {
  background(#FF05AC);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(12, 360);
  for (int r = radius; r > 0; r-=200) {
    fill(h, 40, 95,r);
    ellipse(x, y, 40, 30);
    ellipse(x, y, 40, 70);
    ellipse(x, y, 40, 110);
    ellipse(x, y, 40, 150);
    ellipse(x, y, 40, 190);
    ellipse(x, y, 40, 230);
    fill(r, h, #F079C8, #F079C1);
    ellipse(x,y, r, r);
    h = (h + 1) % 360;
 
  
  }

 
}
