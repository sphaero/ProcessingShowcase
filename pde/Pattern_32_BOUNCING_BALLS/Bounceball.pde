class Bounceball{

  float size;
  float posX;
  float posY;
  float speedX;
  float speedY;
  color col;
  
  
  // CONSTRUCTOR
  Bounceball(){
    size = random(20,90);
    posX = random(size,width-size);
    posY = random(size,height-size);
    float direction = 1-(2*int(random(0,2)));
    speedX = random(2,10)*direction;
    speedY = random(2,10)*direction;
    col = colAll[int(random(1,5))];
  }
  
  
  // FUNCTIONS
  void show(){
    // Draw the Ball
    fill(col);
    ellipse(posX,posY,size,size);
    
    // Add x- and y-speed to the Balls current location
    posX += speedX;
    posY += speedY;
    
    //Flip individual x- and/or y-speed when the ball hits the edge of the screen
    if (posX >= width-size/2 && speedX > 0 || posX <= 0+size/2 && speedX < 0){
      speedX *= -1;
    }  
    if (posY >= height-size/2 && speedY > 0 || posY <= 0+size/2 && speedY < 0 ){
      speedY *= -1;
    }
  }
}
