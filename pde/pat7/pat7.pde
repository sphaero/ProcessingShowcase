

int w = 20;
int h =20;
int x = 60;

color c1 = #808000;
color c2 = #FF7034;
color c3 = #FFDB58;
color c4 =  #EBD7A8;
color[] colors = {c1, c2, c3, c4};
int count = 0;

int angle = 1;

void setup() {
  size(720,480);
  //fullScreen();
  
}

void draw() {

  call_functions();
  
  
}


void call_functions(){
  make_rect();
  make_stroke();
  make_circles();
}




void make_rect(){
  noFill();
  rectMode(CENTER);

  stroke(#808000);
  w += x*1.5;
  h += x;
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  strokeWeight(2);
  rect(0,0, w, h);
  popMatrix();
  
  if(w >= width || w <= 10){
     x*= -1;
   }
 }
   
   
void make_stroke(){
  
      stroke(#FF7034);

  
  float random_x = random(width/6*3);
  float random_y = random(0,height);
  for(int i=0;i<=10;i++){
    beginShape();
      curveVertex(0,  height/2);
      curveVertex(random(width/6),  random(0,height));
      curveVertex(random((width/6)*2),  random(0,height));
      
      curveVertex(random_x,  random_y);
      
      curveVertex(width/2, height/2);
    endShape();
    
    beginShape();
      curveVertex(width,  height/2);
      curveVertex(width - random(width/6),  random(0,height));
      curveVertex(width - random((width/6)*2),  random(0,height));
      
      curveVertex(width - random_x,  random_y);
      
      curveVertex(width/2, height/2);
    endShape();
  } 
}


void make_circles(){
  fill(#FFDB58);
  noStroke();
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(angle));
    ellipse(20,20,10,10);
    rotate(radians(-angle*2));
    ellipse(50,50,15,15);
    rotate(radians(angle*1.5));
    ellipse(80,80,15,15);
   
    
  popMatrix();
  angle+=5;
}
