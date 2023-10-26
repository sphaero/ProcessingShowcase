void setup() {
  size(720, 480);
  frameRate(120);
}

void draw() {
  background(0);
  
  stroke(155, 93, 229);
  tile(int(sin(frameCount * (1 / 34.)) * (width / 4) + width / 2), height/2, false);
  
  stroke(143, 247, 92);
  tile(int(-sin(frameCount * (1 / 34.)) * (width / 4) + width / 2), height/2, true);
  
  stroke(255, 255, 255);
  tile(width/2, int(-cos(frameCount * (1 / 34.)) * (height / 4) + height / 2), true);
}

void tile(int xpos, int ypos, boolean reverseDirection) {
  noFill();
  strokeWeight(4);
  int step = 10;
  while (step < 300) {
    // Bounce off the frame edges
    if (xpos < 0 || xpos > width) {
      xpos = constrain(xpos, 0, width);
    }
    if (ypos < 0 || ypos > height) {
      ypos = constrain(ypos, 0, height);
    }
    
    circle(xpos, ypos, step);
    
    if (reverseDirection) {
      xpos += int(sin(frameCount * (1 / 34.)) * 2);
      ypos += int(cos(frameCount * (1 / 34.)) * 2);
    } else {
      xpos -= int(sin(frameCount * (1 / 34.)) * 2);
      ypos -= int(cos(frameCount * (1 / 34.)) * 2);
    }
    
    // Adjust step increment here
    step = step + 50;
  }
}
