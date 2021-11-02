import netP5.*;
import oscP5.*;

OscP5 oscP5;

void setup()
{
  size(720, 480);
  oscP5 = new OscP5(this,6200);

}

void draw() 
{


  {
    background(255);

 
 strokeWeight(8);
 ellipse(sin(frameCount*0.01)*300,300,20,20);
  fill(0,0,210);
  
  ellipse(sin(frameCount*0.01)*250,250,20,20);
  fill(0,0,210);
   ellipse(sin(frameCount*0.01)*200,200,10,10);
  fill(0,0,210);
  
    ellipse(sin(frameCount*0.01)*100,100,20,20);
  fill(0,0,210);
  
 ellipse(sin(frameCount*0.01)*190,190,20,20);
  fill(0,0,210);
  
  ellipse(sin(frameCount*0.02)*120,120,20,20);
 fill(0,0,210); 
 
 ellipse(sin(frameCount*0.10)*300,300,20,20);
 fill(0,0,210); 
 
 
 ellipse(sin(frameCount*0.01)*300,300,20,20);
  fill(0,0,210);
  
 // GROTE RONDJE rood
 ellipse(sin(frameCount*0.07)*100,100,200,200);
  fill(0,0,210);
  
   ellipse(sin(frameCount*0.02)*100,100,200,200);
  fill(0,0,210);
  
 //blauw rondje
 ellipse(sin(frameCount*0.1)*200,200,200,200);
  fill(0,0,210);
  
   ellipse(sin(frameCount*0.1)*150,150,200,200);
  fill(0,0,210);
  //rect(sin(frameCount*0.03)*width/2+width/100,100,200,200);
  // fill(0,0,220);


 // GROTE RONDJE rood
 ellipse(sin(frameCount*0.06)*500,300,200,200);
  fill(0,0,210);
  
   ellipse(sin(frameCount*0.04)*400,400,200,200);
  fill(0,0,210);
  
 //blauw rondje
 ellipse(sin(frameCount*0.1)*500,400,200,200);
  fill(0,0,210);
  
   ellipse(sin(frameCount*0.06)*500,300,200,200);
  fill(0,0,210);
  
 //blauw rondje
 ellipse(sin(frameCount*0.1)*500,400,200,200);
  fill(0,0,210);
  
////
ellipse(sin(frameCount*0.06)*500,300,200,200);
  fill(0,0,210);
  
 //blauw rondje
 ellipse(sin(frameCount*0.1)*500,400,200,200);
  fill(0,0,210);
  
   ellipse(sin(frameCount*0.06)*800,400,200,200);
  fill(0,0,210);
  
 //blauw rondje
 ellipse(sin(frameCount*0.1)*200,200,200,200);
  fill(0,0,210);

 
 
 
}
  
}
