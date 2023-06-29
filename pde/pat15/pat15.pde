// Tjerk

int rand = 10;
int xspeed2 = 2;
int count2 = 20;

int w = 5;
int h = 5;
int x = 25;

int i_r = 5; 
int i_g = 10; 
int i_b = 5; 

int r = 80;
int g = 100;
int b = 50;

int angle = 5;


void setup() {
  size(720, 480);
  background(255);
}

int count = 0;
void draw() {
  // draw for 4 counts white background after every 22th count
  if ( count > 22  )
  {
    background(255);
  } else if (count < 4)
  {

    call_functions();
  } else {
    background (100 + int(random(255))); //(int(random(255)));//int(random(255)), int(random(255)));
    strokeWeight(int(random(10)));

    blokje2(width, 120, -20);
    blokje2(50, 300, 10);
    blok(0, 480, 1.5);
    blok(0, 5, 1.2);
  }

  // loop count until 26 
  if (count == 26)
  {
    count = 0;
  } else
  {
    count = count + 1;
  }
}


void call_functions() {

  colour_change();
  make_rect();
  
}

void colour_change() {
  if (r>=160 || r<=50) {
    i_r*=-1;
  }
  if (g>=100 || g<=20) {
    i_g*=-1;
  }
  if (b>=150 || b<=20) {
    i_b*=-1;
  }

  r += i_r;
  g += i_g;
  b += i_b;
}


void make_rect() {
  noFill();
  rectMode(CENTER);

  stroke(10);
  w += x*1.5;
  h += x;
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  strokeWeight(2);
  rect(0, 0, w, h);
  popMatrix();

  angle+= (int(random (-rand, rand)));

  if (w >= width || w <= 10) {
    x*= -1;
  }
}


// xpos2 is slechts een start positie en respawn positie op deze manier
void blokje2(int xpos2, int ypos2, int xspeed)
{
  fill(100, 123, 0);
  //strokeWeight(2);
  rect(xpos2 + frameCount*xspeed % width, ypos2, 300, 60);

  if (xpos2 >= width || xpos2 <= 10)
  {
    xspeed -= 1;
    println(frameCount);
  }
}


void blok(int G, int J, float K)
{
  //background (96);
  fill(255, 113, 52);
  rect(count2 + G, J, 200, 100);
  count2 += xspeed2 * K;
  {


    if (count2 >= width || count2 <= 0)     
    {
      xspeed2 = xspeed2 * -1;
    }
  }
}
