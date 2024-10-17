class Star {
  float x;
  float y;
  
  Star(){
   x = random(0, 850);
   y = random(0,300); 
  }
  
   void move()
   {
     x = x - 0.5;
     if ( x < -20)
     {
       x = 850;
     }
   }
   
   void appear()
   {
     fill(255,255,255);
     noStroke();
     ellipse(x,y,5,5);
   }
   
}
   
