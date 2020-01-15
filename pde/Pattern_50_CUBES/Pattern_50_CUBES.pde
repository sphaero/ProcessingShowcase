
Cube[] cubes = new Cube[15];
Cube bg;



void setup() {
  size(720,480,P3D);
  background(0);
  surface.setResizable(true);
  noStroke();
  bg = new Cube("j");
  
  for( int i=0; i < cubes.length; i++){
    cubes[i] = new Cube();
  }
}

void draw(){
  //cube(0, 2000, 10, 1500, 2500);
  //test0.show();
  background(0);
  
  lightFalloff(1.0, 0.001, 0.0);
  pointLight(204, 0, 204, width, height/2, 200);
  pointLight(0, 204, 204, -width, height/2, 200);
  //pointLight(104, 104, 104, width/2, height/2, 300);
  bg.show();
  for( int i=0; i < cubes.length; i++){
    cubes[i].show();
  }
}


void cube(float Y, int X, int Xmod, int min, int max) {
  background(0);
  lightFalloff(1.0, 0.001, 0.0);
  pointLight(204, 0, 204, width, height/2, 200);
  pointLight(0, 204, 204, -width, height/2, 200);
  //pointLight(104, 104, 104, width/2, height/2, 300); 
  translate(width/2,height/2);
  rotateZ(Y);
  rotateX(Y);
  rotateY(Y);
  box(X, X, X);
  X = X + Xmod;
  Y = Y + 0.01;
  if (X > max | X < min){
    Xmod = Xmod * -1;
  }
}
