int x, y;
int xo, yo;
char dir;
ArrayList lines = new ArrayList();
int lineCount;

void setup() {
  size(640, 360);
  colorMode(RGB);
  smooth();
  frameRate(30);
  background(255);
  strokeCap(PROJECT);
  stroke(0);
  start();
}

void start() {

  lineCount = int(random(1, 15));

  for (int i = 0; i < lineCount; i++) {
    y = int(random(1, height));
    x = int(random(1, width));
    switch(int(random(0, 2))) {
    case 0:
      dir = 'H';
      break;
    case 1:
      dir = 'V';
      break;
    }
    // Line (int x1, int y1, int x2, int y2, int wweight, char HV)
    lines.add(new Line(x, y, int(random(2, 15)), dir));
    //Line L = (Line) lines.get(i);// to cast the object coming out
  }
}

void draw() {
  

  background(255);
  for (int i = 0; i < lines.size(); i++) {
    Line L = (Line) lines.get(i);// to cast the object coming out
    L.drawLine(L.direction);
  }
  
    fill(252,13,27);     // square red
    rect(255,240,135,244);
        fill(3,33,100);  //square blue
    rect(23,29,105,632);
            fill(254,223,81);  //square yellow
    rect(444,13,340,240);
}

void keyPressed(){
  start();
}


class Line {
  int weight;
  int x;
  int y;
  int xo;
  int yo;
  int xx;
  int yy;
  int speedX;
  int speedY;
  int speedXX;
  int speedYY;
  char direction;

  Line (int x1, int y1, int wweight, char HV) {
    x = x1;
    xo = x1;
    xx = x1;
    y = y1;
    yo = y1;
    yy = y1;
    weight = wweight;
    direction = HV;
    speedX = int(random(1, 4));
    speedY = int(random(1, 4));
    speedXX = int(random(1, 4));
    speedYY = int(random(1, 4));
  }

  void drawLine(char dire) {
    stroke(0);
    strokeWeight(weight);
    x+=speedX;
    y+=speedY;
    xx-=speedXX;
    yy-=speedYY;
    loadPixels();
    switch(dire) {
    case 'H':
      line(x, yo, xo, yo); //horizontal right
      line(xo, yo, xx, yo); // horizontal left

      if (x > width) {
        speedX*=0;
      } else if (x < 0) {
        speedX*=0;
      } else if (xx > width) {
        speedXX*=0;
      } else if (xx == 0) {
        speedXX*=0;
      }

      if (pixels[yo*width+x] == -16777216) {
        speedX*=0;
      }
      int index = int(yo*width+xx);
      if (index > 160000) {
        index = 160000;
      }
      if (pixels[index] == -16777216) {
        speedXX*=0;
      }

      break;

    case 'V':
      line(xo, yy, xo, yo); //vertical up
      line(xo, yo, xo, y); //vertical down
      if (y > height) {
        speedY*=0;
      } else if (y < 0) {
        speedY *=0;
      } else if (yy > height) {
        speedYY*=0;
      } else if (yy < 0) {
        speedYY*=0;
      }
      break;
    }

    println("x = " +x+ " yo = " +yo+ " xo = "+xo);
    println(yo*width+x);

    /*
   else if(pixels[yo*width+xx] == -16777216){
     speedXX*=0;
     }
     
     if (pixels[yo*width+x] == -16777216){
     speedX *=0;
     }*/
  }
}

// box structure for later.
class Box {

  Box() {
  }

  void drawBox() {
  }
}
