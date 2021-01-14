import procmod.*;

ModPlayer mplayer;

import processing.video.*;

int videoScale = 16;
int cols, rows;
Movie video;

void setup() {  
  size(720,480);
  cols = width/videoScale;
  rows = height/videoScale;
  video = new Movie (this, "VidPat36.mp4");
  video.play();
  mplayer = new ModPlayer (this, dataPath ("pat36.mod"));
  mplayer.play();
}

void movieEvent(Movie video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  if ( (video.pixels.length > 0) )
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*videoScale;
      int y = j*videoScale;
      color c = video.pixels [i + j *video.width] ;
      fill(c);
      stroke(0);
      rect (x, y, videoScale, videoScale);
    }
  }}
}
