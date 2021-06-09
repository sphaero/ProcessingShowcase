class Star {
  float x;
  float y;
  float z;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random( width); 
  }
  
  void update(){
    z = z - 4;
     if (z < 1) {
       z = width;
       x = random(-width, width);
       y = random(-height, height);  
     }
  }
  
  void show(){
    fill(243, 167, 18);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    ellipse(sx, sy, 1, 700);
  }
}  
