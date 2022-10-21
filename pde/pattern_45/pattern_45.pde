float x, y;
float xStep = 10;
float yStep = 50;
float a, a_;
int num = 320;


void setup(){
  size(720,480);

}

void draw() {
  background(255, 255, 255);
  strokeCap(CORNER);
  strokeWeight(xStep);
  
  int n=0;
  while (n<num) {
    stroke(255-255*cos(radians(a)),5*cos(radians(a)),5-5*sin(radians(a)),255-255*sin(radians(a)));
    line(x,y,x,y+yStep);  
    x+=xStep; 
    if (x>width){
      x=xStep/2;
      y+=yStep;  
    }
   if(y>=height){
     y=0;
     a=0;
    }
    n++;
    a+=a_;
  }
  a_+=0.1;
}
