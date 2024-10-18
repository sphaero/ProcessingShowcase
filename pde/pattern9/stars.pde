class Star {
  float x;
  float y;
  float Size;
  
  Star(){
   x = random(0, 850);
   y = random(0,300); 
   Size = random(0,5);
  }
  
   void move()
   {
     x = x - 0.5;
     if ( x < -20)
     {
       x = 850;
       Size = random(2,7);
     }
   }
   
   void appear()
   {
     fill(255,255,255);
     noStroke();
     ellipse(x,y,Size,Size);
   }
   
}
   
