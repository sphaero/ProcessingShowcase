// VARIABLES

int konfCount = 500;
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};

Konfetti[] bunt = new Konfetti[konfCount];


void setup(){
  size(720,480);
  background(darkblue);
  noStroke();
  for (int i=0; i < bunt.length; i++){
    bunt[i] = new Konfetti();
  }
}

void draw(){
  //background(darkblue,50);
  for (int i=0; i < bunt.length; i++){
    bunt[i].show();
  }
  if(frameCount % 30 == 0){
    for (int i=0; i < bunt.length; i++){
      bunt[i] = new Konfetti();
    }
  }
}

void mousePressed() {
  for (int i=0; i < bunt.length; i++){
    bunt[i] = new Konfetti();
  }
}
