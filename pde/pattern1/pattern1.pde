void setup() {
  size(720, 480);
  background(#9B5DE5);
  noStroke();
  frameRate(15); // Increase frame rate for smoother animation
}

void draw() {
  float x1 = frameCount * 0.01 * 7 / 6;
  float x2 = frameCount * 0.1 * 110 / 60;
  float clock_h = width / 2;
  float clock_v = height / 2;
  float clockRadius = 200; // Radius of the clock
  
  // Draw clock face
  fill(255);
  strokeWeight(15);
  stroke(0);
  fill(#8FF75C);
  circle(clock_h, clock_v, clockRadius * 2);
  line(clock_h, clock_v, clock_h + 100 * cos(x1), clock_v + 100 * sin(x1));
  line(clock_h, clock_v, clock_h + 150 * cos(x2), clock_v + 150 * sin(x2));
  fill(0);
  circle(clock_h, clock_v, 10);
    strokeWeight(5);
  // Generate and draw raindrops within the circular bounds of the clock face
  for (int i = 0; i < 20; i++) {
    float raindropX, raindropY;
    do {
      raindropX = random(clock_h - clockRadius, clock_h + clockRadius);
      raindropY = random(clock_v - clockRadius, clock_v + clockRadius);
    } while (dist(raindropX, raindropY, clock_h, clock_v) > clockRadius);
    
    fill(0, 0, 255); // Blue color for raindrops
    ellipse(raindropX, raindropY, 5, 20); // Draw an ellipse as a raindrop
  }
}
