int ranges = 100;
int numCircles = 50;
float angleIncrement = 0.5; // Slower rotation speed
float radiusIncrement = 0.05;
float maxRadius;
float angle = 0;
float startTime=0.;;
color c1 = #808000;
color c2 = #FF7034;
color c3 = #FFDB58;
color c4 =  #EBD7A8;
color[] colors = {c1, c2, c3, c4};
int count = 0;

void setup() {
  size(720, 480);
  startTime=millis(); 
  radiusIncrement=0.05;
  angleIncrement=0.5;
}

void draw() {
  count += 1;
  if (count  == 3) {
    count = 0;
  }

  noFill();
  strokeWeight(2);

  for (int i = 0; i < ranges; i++) {
    stroke(colors[count]);

    beginShape();
    for (int x = -10; x < width + 11; x += 20) {
      float n = noise(x * 0.001, i * 0.01, frameCount * 0.02);
      float y = map(n, 0, 1, 0, height);
      vertex(x, y);
    }
    endShape();
  }
  if (frameCount>150) {

    push();
    translate(width/2, height/2);

    // Calculate the elapsed time since the start of the animation
    float elapsedTime = millis() - startTime;

    for (int i = numCircles; i > 0; i--) {
      float currentRadius = i * radiusIncrement;
      float x = cos(angle) * currentRadius;
      float y = sin(angle) * currentRadius;
      int colorIndex = i % colors.length;
      fill(colors[colorIndex]);
      ellipse(x, y, currentRadius * 2, currentRadius * 2);
      angle += angleIncrement;

      // Increase the radiusIncrement based on elapsed time
      radiusIncrement += elapsedTime * 0.0000001;
    }
    pop();
  }
}

void mousePressed()
{
  frameCount = -1;
}
