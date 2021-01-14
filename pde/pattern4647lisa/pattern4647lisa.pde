import procmod.*;

ModPlayer mplayer;


void setup() {
  size(720, 480);
  mplayer = new ModPlayer(this, dataPath("tune5.mod"));

  mplayer.play();
 
}

int dim;


void draw() {
  
  dim = width/2;
  background(#181955);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);


  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {
  int radius = dim/4;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 40, 90);
    ellipse(x, y, r, r);
    ellipse (x, y, r, h);
    rect (120, 90, r,h);
    stroke (30,40, r ,r );
    rect (482,90,r,h);
    stroke (x,y,r,r);
    stroke (y,x,r,r);
    h = (h + 1) % 360;
}
  }
