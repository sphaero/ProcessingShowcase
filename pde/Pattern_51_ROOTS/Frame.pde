class Frame{
  
  float x;
  float y;
  float z;
  float zspeed;
  float r;
  float rspeed;
  float wid;
  float hei;
  float thick;
  boolean reachedEnd = false;
  color col = white;
  Spline[] splines = new Spline[int(random(25,30))];
  
  
  // CONSTRUCTORS
  // 1) Main
  Frame(){
    thick = 35;
    wid = width+30;
    hei = height+30;
    x = -15;
    y = -15;
    z = 1.5;
    zspeed = 0.01;
    r = 0;
    rspeed = 0.1;
    ///*
    for(int i=0; i<splines.length; i++){
      splines[i] = new Spline();
    }
    //*/
  }
  
  
  void show(){ 
    
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(r));
    r += rspeed;
    scale(z);
    translate(-width/2,-height/2);

    for(int i=0; i<splines.length; i++){
      splines[i].show();
    }
    fill(col);
    noStroke();
    rect(x, y, wid, thick);
    rect(x, y, thick, hei);
    rect(x+wid-thick, y, thick, hei);
    rect(x, hei-thick, wid, thick);
    popMatrix();
    z -= zspeed;
    if (z <= 0){
      z = 0;
      reachedEnd = true;
    }
    zspeed *= 0.9935;
    
  }
  

  
}
