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
}
