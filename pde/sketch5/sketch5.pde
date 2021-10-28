int num = 48; 
int timeDelay = 50;
int time = 0;
int lastTime = 0; 
int fadeout = 480;
int fadein = -100; 
float[] y = new float [num];
float sW;
PFont f;

void setup() { 
  size(720,480); 
  
  
  

  
  for (int n=0; n<num; n++) {
    y[n] = height/num*n;
  }
  sW=height/num/2;
}


boolean textfadesin = true;
boolean textfadesout = true;


void draw() {
  
  background(0);
  
  for (int n=0; n<num; n++) {
    float alpha = map(y[n], 0, height, 0, 255);
    stroke(255, alpha);
    strokeWeight(sW); 
    line(0, y[n], width, y[n]); 
    
    y[n] += 0.5;
    if (y[n]>height) y[n]=0.5;
  }
  
  stroke(255, 68, 0);
  strokeWeight(height/1.7);
  noFill();
  ellipse(width/2, height/2, height+height/5, height+height/5);
  
{    
  if (textfadesin) {
    textSize(150);
    smooth(); 
    textAlign(CENTER); 
    tint(255); 
    tint(255, fadein+100); 
    fill(255, fadein); 
    text("WOOOOOH", width/2, 200); 
    fadein++; 
} 

  else {
 if (textfadesout) {
    textSize(150);
    smooth(); 
    textAlign(CENTER); 
    tint(255); 
    tint(255, fadeout-100); 
    fill(255, fadeout); 
    text("WOOOOH", width/2, 280); 
    fadeout--; 
}
  }
  if (millis() - time >= timeDelay) {
    time = millis();
    textfadesin = !textfadesin;
    textfadesout = true;
  }
}
}




    
