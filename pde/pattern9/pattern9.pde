


//Tune 1 Pattern 9 door Julia Arbouw met hulp van tutorial van coding train op youtube
//@julialena.art instagram


import procmod.*;
Star[] stars = new Star [800];
float speed;
ModPlayer mplayer;

class Star {
  float x;
  float y;
  float z;

  float pz;

  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }

  void update() {
    z= z - speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }


  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);

    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r);

float px =  map(x / pz, 0, 1, 0, width);
float py = map(y / pz, 0, 1, 0, height);
pz = z;
    stroke(255);
    strokeWeight(2);
    line(px, py, sx, sy);


  }
}




void setup() {
  size(720, 480);
    for (int i= 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
    //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat9.mod"));
  //  play it rightaway
  mplayer.play();
}

void draw() {
  speed = map(600, 0, width, 0 , 20);
  background(0);
  translate(width/2, height/2);
  for (int i= 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
