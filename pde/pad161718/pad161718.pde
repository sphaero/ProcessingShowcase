void setup()
{
size(720,480);
strokeWeight(1);
rectMode (CENTER);
background(0,0,0);
}

void draw(){
  for(int x = 20; x<720; x+=20){
    //fill(random(255),random(255),random(255));
      for(int 
      y = 20; y<480; y += 20){
           fill(x/2,y/2,frameCount%255);
    rect (x,y,random(1,10),10);
    
    }
  }
    
  
}
