class Cube{
  
  //VARIABLES
  float xStart;
  float yStart;
  float rot;
  float size;
  float sizeMin;
  float sizeMax;
  float sizeSpeed;
  float rotSpeed;
  
  
  //CONSTUCTOR
  
  Cube(float _xStart, float _yStart){
    sizeMin = 0;
    sizeMax = 100;
    sizeSpeed = 5;
    rotSpeed = 0.01;
    xStart = _xStart;
    yStart = _yStart;
    rot = radians(random(360));
    size = random(sizeMin,sizeMax);
  }
  
  Cube(){
    sizeMin = 0;
    sizeMax = 100;
    sizeSpeed = 5;
    rotSpeed = 0.01;
    xStart = random(width);
    yStart = random(height);
    rot = radians(random(360));
    int coin = int (random(0,2));
    if (coin == 0) {
      size = sizeMin;
    }
    else {
      size = sizeMax;
    }
  }
  
  Cube(String blub){
    sizeMin = 1500;
    sizeMax = 2500;
    sizeSpeed = 20;
    rotSpeed = 0.01;
    xStart = random(width);
    yStart = random(height);
    rot = radians(random(360));
    size = random(sizeMin,sizeMax);
  }
  
  //FUNCTIONS
  void show(){
     
    pushMatrix();
    translate(xStart,yStart);
    rotateZ(rot);
    rotateX(rot);
    rotateY(rot);
    box(size, size, size);
    popMatrix();
    size += sizeSpeed;
    rot += rotSpeed;
    if (size > sizeMax | size < sizeMin){
      sizeSpeed *= -1;
    }
  }
  
}
