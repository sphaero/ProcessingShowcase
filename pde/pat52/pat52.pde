PFont myFont;

void setup() {
  size( 720, 480);
  myFont = createFont("Helvetica-Bold.ttf", 100);

// The font must be located in the sketch's 
// "data" directory to load successfully
}

void draw() {
  
  if ( frameCount % 6 == 0 ) {
    background(0);
    for ( int x = 10; x < 720; x+=100 ) { 
      for ( int y = 10; y < 480; y+=10 ) {
        noStroke();
        fill(0, 0, random(255),60);
        rect(x, y, random(100), random(300),5);
      }
    }
  }
   if ( int(millis() % 416.6666) < 20 ) {
      fill(260,random(200),random(100,255));
      textFont(myFont);
      textAlign(CENTER, CENTER);
      text("暗証", width/2, height/2);
   }
  else {
    fill(20,random(90,23),random(190,255));
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text("暗証", width/2, height/2);

   }
}
