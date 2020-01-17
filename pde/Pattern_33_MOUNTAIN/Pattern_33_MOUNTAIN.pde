PGraphics pg;


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

color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};
color col = colAll[int(random(1,4))];;

void setup() {
  size(640,360,P3D);
  background(0);
  surface.setResizable(true);
  noStroke();
  pg = createGraphics(200,200);
}

void draw() {
  //DRAW BG
  background(darkblue);
  
  //DRAW ELLIPSE (SUN)
  fill(red);
  ellipse(width/2,height/3*1.5,height/2,height/2);
  
  //DRAW TRIANGLES
  
  fill(col);
  triangle(width/2-x,(height/2-y+5)*rheight,width/4*3-x,height-y,width/4-x,height-y);
  triangle(width/2+x,(height/2-y+5)*rheight,width/4*3+x,height-y,width/4+x,height-y);
  triangle(width/2-x*1.5,(height/2-y+5)*rheight,width/4*3-x*1.5,height-y,width/4-x*1.5,height-y);
  triangle(width/2+x*1.5,(height/2-y+5)*rheight,width/4*3+x*1.5,height-y,width/4+x*1.5,height-y);
  
  //DRAW GROUND
  fill(red);
  rect(0,height/2,width,height);
  println("next");
  while (raster < height) {
    fill(255-raster/2,255-raster/2,255);
    color tempcol = lerpColor(red,white,raster/150);
    fill(tempcol);
    println(raster);
    rect(0,height/2+raster,width,sq(raster)/100);
    raster = raster * 1.2 * teller;
  }
  
  /*
  //DRAW CONFETTI
  processShapes(200,1);
  
  /*
  //DRAW TEST
  pg.beginDraw();
  pg.fill(255,0,255);
  pg.ellipse(95,95,190,190);
  pg.endDraw();
  PImage processedImage = Gaussian.apply(pg, 7, 20);
  blendMode(ADD);
  image(processedImage, width/2-100, height/2-100);
  blendMode(NORMAL);
  */
  
  //ALTER VALUES FOR NEXT ITERATION
  x = x*(1+(0.02*speed));
  y = y*(1.+(0.016*speed));
  raster = 1;
  teller = teller * 1.0015;
  
  //RESET CODE
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
    col = colAll[int(random(1,4))];
  }
}
