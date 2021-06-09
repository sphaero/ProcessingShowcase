static final int NUM_LINES = 10;

float t;

void setup (){
  size (720,480);
}
  
  void draw (){
    background(0);
    stroke (#FF007F);
    strokeWeight(3);
    
    pushMatrix();
    translate(width/2, height/2);
    
    for (int i = 0; i < NUM_LINES; i++){
    line (x1(t+i), y1(t+i),x2(t+i), y2(t+i));
    }
    t += 7;
    popMatrix();
  }
   
float x1(float t) {
  return sin(t/10) * 50 + sin(t/15) * 20;
}

float y1(float t) {
  return cos(t/70) * 20 + sin(t/10) * 0;
}
  
float x2(float t) {
  return sin(t/10) * 1000 + sin(t/15) * 50;
}

float y2(float t) {
  return cos(t/5) * 200 + sin(t/5) * 30;
}
