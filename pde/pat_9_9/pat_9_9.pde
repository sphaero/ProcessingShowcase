float count = 0;
int xpos = 370;
int xspeed = 5;
int ypos = 240;
int yspeed = 5;

float r = 255;
float g = 255;
float b = 0;


void setup() {
  size(720,480);
  background(0);
  noStroke();
}

void draw(){

  xpos = xpos + xspeed;
  ypos = ypos + yspeed;
  count = count + 1;
 
  if (xpos >= width){
    xspeed = xspeed * -1;
    fill(int(random(r)),int(random(g)),int(random(b)));
  }
  if (xpos <= 0){
    xspeed = xspeed * -1;
    fill(int(random(r)),int(random(g)),int(random(b)));
  }
  
  if (ypos >= height){
    yspeed = yspeed * -1;
    fill(int(random(r)),int(random(g)),int(random(b)));
  }
  if (ypos <= 0){
    yspeed = yspeed * -1;
    fill(int(random(r)),int(random(g)),int(random(b)));
  }
  
  ellipse(xpos,ypos,10,10);


}
