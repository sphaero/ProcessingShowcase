void setup() {
  size( 720, 480);
  background(0, 0, 0);
}

void draw() {

  if ( frameCount % 1 == 0 ) {
    for ( int x = 10; x < 720; x+=10 ) { 
      for ( int y = 10; y < 480; y+=10 ) {
        noStroke();
        fill(0, random(255), 0);
        ellipse(x, y, random(10), random(10));
      }
    }
  }
  if ( int(millis() % 416.6666) < 20 ) {
    background(0);
    for ( int x = 1; x < 720; x+=50 ) { 
      for ( int y = 1; y < 480; y+=50 ) {
        strokeWeight(random(8));
        stroke(255);
        fill(0, random(255), 0);
        rect(x, y, random(50), random(50));
      }
    }
  }
}
