int strobe=0; 
int angle=0;

void setup() {
  loadSounds(68,69);
  size(720,480);
  noStroke();
}

void draw(){
      {
      playSounds();
      }
        if (strobe == 5)
          {
            background(255);
            strobe = 0;
          }
        else
         {
            background(0);
         }
      strobe = strobe + 1;


  pushMatrix();
    fill(255,0,00);
    translate(170,240);
    rotate(frameCount);
    rect(-15,-160,30,320);
  popMatrix();
  
 pushMatrix();
    fill(255,0,00);
    translate(170,240);
    rotate(frameCount);
    rect(-160,-15,320,30);
  popMatrix();  
  
  pushMatrix();
    fill(255,0,00);
    translate(550,240);
    rotate(frameCount);
    rect(-15,-160,30,320);
  popMatrix();
 
 
  pushMatrix();
    fill(255,0,00);
    translate(550,240);
    rotate(frameCount);
    rect(-160,-15,320,30);
  popMatrix();
  
}
