
// GLOBAL SETTINGS 
int frmLen = 10;  // How many "Rootframes" will be generated in total

//STUFF YOU SHOULD NOT TOUCH ANYMORE
Frame[] frames = new Frame[frmLen];
int initialized;
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};


void setup() {
  size(720,480);
  background(darkblue);
  strokeWeight(2.5);
  stroke(255);
  frames[0] = new Frame();
  initialized = 1;
}


void draw() {
  
  // Refresh image  
  background(darkblue);
  
  
  // FRAMES & ROOTS
  if(frameCount%150 == 0 && initialized < frmLen){  // Spawn a new "Rootframe" each 150 frames
    frames[initialized] = new Frame();
    initialized += 1;
  }

  for(int i=0; i<initialized; i++){  // Render "Rootframes"
    if(frames[i].reachedEnd == false){
      frames[i].show();
    }
  }
  
}
