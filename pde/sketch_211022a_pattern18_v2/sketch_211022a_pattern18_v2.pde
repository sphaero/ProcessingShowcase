float teller = 1;
float delta = 1;
//int fill = 250;

void setup()
{
  size(720,480);

}

void draw()
{
  background(96);

      
  //Rotating loop rect 2
      pushMatrix();
        rectMode(CENTER);
        translate(width/2,height/2);
        rotate(degrees(frameCount%360*0.004));
          //rect(cos(frameCount/20.0)*250+250, 0, 100, cos(frameCount/20.0)*250+250);
        rect(0, 0, teller, teller);  
          stroke(0);
          strokeWeight(10);
          fill(0);
        rect(10, teller, teller, 0);  
          stroke(255);
          strokeWeight(10);
          fill(0);
        
      popMatrix();
      
    //
    pushMatrix();
      rectMode(CENTER);
        translate(width/2,height/2);
        rotate(degrees(frameCount%360*0.004));
        ellipse(100, 50, 50, 50);  
          stroke(255);
          strokeWeight(10);
          fill(0);
    popMatrix();
    //
    pushMatrix();  
      rectMode(CENTER);
        translate(width/2,height/2);
        rotate(degrees(frameCount%360*0.008));
        rect(50, 50, 50, 50);  
          stroke(255);
          strokeWeight(10);
          fill(0);
    popMatrix();
    //
    pushMatrix(); 
     rectMode(CENTER);
        translate(width/2,height/2);
        rotate(degrees(frameCount%360*0.012));
        ellipse(30, 440, 10, 10);
          stroke(255);
          strokeWeight(10);
          fill(0);
    popMatrix();
    //
    pushMatrix();   
     rectMode(CENTER);
        translate(width/2,height/2);
        rotate(degrees(frameCount%360*0.016));
        ellipse(50, 0, 50, 0);
          stroke(57, 255, 20);
          strokeWeight(10);
          fill(255);
    popMatrix();
    

  
  //Ellipse klein moving 1
      fill(0);
      stroke(255);
      strokeWeight(10);
      rotate(220,30,200,15);
      ellipse(sin(frameCount/20.0)*280+340,cos(frameCount/20.0)*200+250, 100, 100);
  //Ellipse klein moving 2
      fill(0);
      stroke(57, 255, 20);
      strokeWeight(10);
      //rotate(220,30,200,15);
      ellipse(sin(frameCount/20.0)*280+340,cos(frameCount/20.0)*200+250, 75, 75);
          //Ellipse klein moving 2
          fill(0);
          stroke(57, 255, 20);
          strokeWeight(10);
          //rotate(220,30,200,15);
          ellipse(sin(frameCount/20.0)*280+340,cos(frameCount/20.0)*200+250, 50, 50);
  //Ellipse klein moving 3
      fill(57, 255, 20);
      stroke(255);
      strokeWeight(10);
      //rotate(220,30,200,15);
      ellipse(sin(frameCount/20.0)*280+340,cos(frameCount/20.0)*200+250, 10, 10);
  
  
  
  
  teller = teller + delta;
  if (teller > 150)
  {
    delta = -1;
  }
  if ( teller < 0)
  {
    delta = 1;
  }
  println(teller);
  //println(frameRate);
}
