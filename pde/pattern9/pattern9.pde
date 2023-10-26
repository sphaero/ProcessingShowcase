// PLACEHOLDER VOOR PATTERN9
// LET OP KLEUREN ZIJN INVERTED
int frameDuration = 468; // Duration of each frame in milliseconds
int lastFrameChangeTime = 0; // The time when the last frame change occurred

void setup() {
  size(720, 480);
  background(142, 247, 92);
  noStroke();
}

void draw() {
  int currentTime = millis();
  
  if (currentTime - lastFrameChangeTime >= frameDuration) {
    // It's time to switch frames
    if (frameFunction == 1) {
      drawframe1();
      frameFunction = 2;
    } else {
      drawframe2();
      frameFunction = 1;
    }
    
    lastFrameChangeTime = currentTime;
  }
}

int frameFunction = 1; // 1 for drawframe1, 2 for drawframe2

void drawframe1() {
  // achtergrond
  fill(155,93,229);
  rect(0,0,720,480);
// Wit
fill(0,0,0);
rect(360,40,100,20);
rect(320,60,100,20);
rect(340,80,60,20);
rect(340,100,100,20);
rect(360,120,120,20);
rect(360,140,100,20);
rect(360,160,80,20); rect(160,160,40,20);
rect(300,180,120,20); rect(180,180,40,20);
rect(280,200,100,20); rect(180,200,60,20); rect(460,200,40,20); rect(540,200,40,20);
rect(260,220,140,20); rect(440,220,120,20);
rect(260,240,160,20); rect(460,240,80,20);
rect(260,260,180,60);
rect(280,320,180,20);
rect(300,340,20,20); rect(460,340,20,80);
rect(280,360,20,60);
rect(240,420,40,20); rect(480,420,40,20);

//paars
fill(142,247,92);
rect(420,60,60,20);
rect(400,80,100,20);
rect(420,100,80,20);
rect(320,260,20,20);

//groen
fill(155,93,229);
rect(420,80,20,20);
rect(300,260,20,20);

//zwart
fill(255,255,255);
rect(340,40,20,20);
rect(320,60,20,40);
rect(340,120,20,60);
rect(160,180,20,40); rect(280,180,20,20);
rect(260,200,20,20);
rect(380,320,40,20);
rect(320,340,40,20); rect(280,340,20,20);
rect(260,360,20,60);
rect(220,420,20,20);
}

void drawframe2() {
  // achtergrond
  fill(155,93,229);
  rect(0,0,720,480);
  //wit  
  fill(0,0,0);
  rect(380,20,100,20);
  rect(340,40,100,20);
  rect(360,60,60,20);
  rect(360,80,80,20);
  rect(380,100,120,20);
  rect(380,120,100,20);
  rect(380,140,80,20); rect(160,140,40,20);
  rect(360,160,80,20); rect(140,160,20,20); rect(180,160,40,20);
  rect(300,180,100,20); rect(140,180,20,20); rect(200,180,40,20); rect(460,180,40,20);
  rect(280,200,100,20); rect(440,200,80,20);
  rect(260,220,140,20); rect(440,220,100,20); rect(560,220,20,20);
  rect(260,240,160,20); rect(500,240,60,20);
  rect(260,260,180,40);
  rect(280,300,160,20);
  rect(300,320,120,20);
  rect(320,340,140,20);
  rect(300,360,20,20); rect(460,360,20,60);
  rect(280,380,20,40);
  rect(220,420,60,20); rect(480,420,40,20);
  
  //Zwart
  fill(255,255,255);
  rect(360,20,20,20);
  rect(340,60,20,40);
  rect(360,100,20,60);
  rect(160,160,20,20); rect(340,160,20,20);
  rect(180,180,20,20); rect(280,180,20,20);
  rect(260,200,20,20);
  rect(460,220,20,20);
  rect(300,340,20,20); rect(380,340,40,20);
  rect(280,360,20,20);
  rect(260,380,20,40);
  rect(200,420,20,20);
  
  // Paars
  fill(142, 247, 92);
  rect(440,40,60,20);
  rect(420,60,100,20);
  rect(440,80,80,20);
  rect(320,240,20,20);
  
  // Groen
  fill(155,93,229);
  rect(440,60,20,20);
  rect(300,240,20,20);
  
}
