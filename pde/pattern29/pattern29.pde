//Radim Horelka, GPT

float count = 0;
float speedX = 2;
float speedY = 1;
float xpos;
float ypos;
float rotationAngle = 0.03;

void setup() {
  size(720, 480);
  xpos = width / 2;
  ypos = height / 2;
}

void draw() {
  background(0);

  
  xpos += speedX;

 
  if (xpos > width - 50 || xpos < 50) {
    speedX *= -1; 
  }

  ypos += speedY;
  if (ypos > height - 50 || ypos < 50) {
    speedY *= -1;
  }


  pushMatrix();
  translate(xpos, ypos);
  rotate(count);
  count += rotationAngle;
  drawCube(0, 0);
  popMatrix();
}

void drawCube(float xpos, float ypos) {
  quad(50, 133, 100, 163, 100, 103, 50, 73);
  fill(254, 254, 247);
  stroke(251, 251, 250);

  quad(150, 133, 100, 163, 100, 103, 150, 73);
  fill(#8FF75C);
  stroke(150, 148, 146);
  fill(#8FF75C);

  quad(100, 103, 50, 73, 100, 43, 150, 73);
  fill(#9B5DE5);
  stroke(101, 101, 101);
  fill(#9B5DE5);
}
