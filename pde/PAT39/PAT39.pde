import procmod.*;

ModPlayer mplayer;

import processing.video.*;

int videoScale = 10;
int cols, rows;
Movie video;

void setup() {  
  size(720,480);
  cols = width/videoScale;
  rows = height/videoScale;
  background(0);
  video = new Movie (this, "VidPat39.mp4");
  video.play();
  mplayer = new ModPlayer (this, dataPath ("pat39.mod"));
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
      for (int j = 0; j< rows; j++) {
        int x = i*videoScale;
        int y = j*videoScale;
        
        int loc = (video.width - i -1) + j * video.width;
        
        color c = video.pixels [loc];
        float sz = (brightness(c)/255) * videoScale;
        
        rectMode(CENTER);
        fill(c);
        noStroke();
        rect(x + videoScale/2, y + videoScale/2, sz, sz);
      }
    }
  }
}
