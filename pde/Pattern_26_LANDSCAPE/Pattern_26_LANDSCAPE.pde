int cube = 800;
float x = 4;
float y = 4;
float raster = 1;
float speed = 1;
float teller = 1;
float r = random(200,255);
float g = random(50);
float b = random(50);
float rheight = random(1,1.1);

void setup() {
  size(640,360,P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  fill(255,0,255);
  ellipse(width/2,height/3*1.5,height/2,height/2);
  fill(r,g,b);
  triangle(width/2-x,(height/2-y+5)*rheight,width/4*3-x,height-y,width/4-x,height-y);
  triangle(width/2+x,(height/2-y+5)*rheight,width/4*3+x,height-y,width/4+x,height-y);
  triangle(width/2-x*1.5,(height/2-y+5)*rheight,width/4*3-x*1.5,height-y,width/4-x*1.5,height-y);
  triangle(width/2+x*1.5,(height/2-y+5)*rheight,width/4*3+x*1.5,height-y,width/4+x*1.5,height-y);
  fill(255);
  rect(0,height/2,width,height);
  while (raster < height) {
    fill(255-raster/2,255-raster/2,255);
    rect(0,height/2+raster,width,sq(raster)/100);
    raster = raster * 1.2 * teller;
  }
  x = x*(1+(0.02*speed));
  y = y*(1.+(0.016*speed));
  raster = 1;
  teller = teller * 1.0015;
  if (teller > 1.0074) {
    teller = 1;
  }
  if (x > width) {
    x = 4;
    y = 4;
    r = random(150,255);
    g = random(150,255);
    b = random(150,255);
    rheight = random(1,1.1);
  }
}
