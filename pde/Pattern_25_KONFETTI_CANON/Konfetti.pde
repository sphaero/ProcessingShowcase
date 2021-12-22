class Konfetti {
  
  float startY;
  float startX;
  float startRot;
  float pos;
  float speed;
  float rot;
  float rotspeed;
  float scale;
  float accc;
  color col;
  
  Konfetti(){
    // Choose random side (top & bottom get 2 numbers each for higher probability)
    int side = int(random(1,7));
    // Depending on the outcome, choose side
    if (side == 1){  // Left side
      startY = int(random(-20,height+20));
      startX = -5;
      startRot = 0;
    } else if (side == 2 || side == 3){  // Top side
      startY = -5;
      startX = int(random(-20,width+20));
      startRot = radians(90);
    } else if (side == 4){  // Right side
      startY = int(random(-20,height+20));
      startX = width+5;
      startRot = radians(180);
    } else if (side == 5 || side == 6){  // Bottom side
      startY = height+5;
      startX = int(random(-20,width+20));
      startRot = radians(270);
    }
    
    int coin = int(random(0,2)); // Simulate a coin flip.
    if (coin == 0){  // Used to keep the rotation-speed from being zero. Choose either...
      rotspeed = radians(random(-20,-10));  //...a radius between # or #...
    } else {
      rotspeed = radians(random(20,10));  //...or a radius between # and #.
    }
    
    pos = 0;
    speed = random(2,10);
    accc = random(0.87,0.96);
    rot = radians(random(0,360));
    scale = random(8,15);
    col = colAll[int(random(1,5))];
  }
  
  
  // Specify direction of Konfetti
  Konfetti(String _dir){
  }
  
  
  void show(){
    pushMatrix();
      translate(startX,startY);
      rotate(startRot);
      translate(pos,0);
      rotate(rot);
      fill(col);
      rect(-scale/2, -scale/2, scale, scale);
    popMatrix();
    
    //Add speed to current position & rotation
    pos += speed;
    rot += rotspeed;
    
    //Change rotation-speed according to acceleration
    if(rotspeed > 0.5){
      rotspeed *= accc;
    }
    else{
      rotspeed = 0;
    }
    
    //Change speed according to acceleration
      if(speed > 0.5){
        speed *= accc;
      }
      else{
        speed = 0;
      }
    }
  
}
