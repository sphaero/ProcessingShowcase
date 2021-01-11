// Dancing girl 3.0 door Lucas Dijkman in pattern 60

import procmod.*;
ModPlayer mplayer;

import processing.video.*;
Movie myMovie;

int strobe = 0;
int blep = 0;

void setup() {
  size(720, 480);
  background(0);
  frameRate(30);
  myMovie = new Movie(this, "Dancing Girl 3.mov");
  myMovie.loop();
  mplayer = new ModPlayer(this, dataPath("pat60.mod"));
  mplayer.play();
}

void draw () {
  tint(strobe);
  image(myMovie, 0, 0);
  loadPixels();
  myMovie.loadPixels();

  // ellipses
  
  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 300, 300 );

  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 250, 250 );

  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(5, 10));
  ellipse(width/2, height/2, 200, 200 );
}



void movieEvent(Movie m) {
  m.read();
}

void modRowEvent( int channel, int instrument, int note) {
  if (channel == 3)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    strobe = note * 3;
  }
}
