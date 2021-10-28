
int xspacing = 1;   
int w;              

float theta = 3.5;  
float amplitude = 100.0;  
float period = 100.0;  
float dx;  
float[] yvalues;  

void setup() {
  size(720, 480);
  w = width+26;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {

  background(0);
  ellipse(width/2, height/2, 950, 950);
  fill(0, 0, 134);
  ellipse(width/2, height/2, 900, 900);
  fill(0, 0, 200);
  ellipse(width/2, height/2, 850, 850);
  fill(0, 0, 34);
  ellipse(width/2, height/2, 800, 800);
  fill(0, 0, 12);
  ellipse(width/2, height/2, 750, 750);
  fill(0, 0, 166);
  ellipse(width/2, height/2, 700, 700);
  fill(0, 0, 88);
  ellipse(width/2, height/2, 650, 650);
  fill(0, 0, 145);
  ellipse(width/2, height/2, 600, 600);
  fill(244);
  ellipse(width/2, height/2, 550, 550);
  fill(0, 0, 22);
  ellipse(width/2, height/2, 500, 500);
  fill(0, 0, 75);
  ellipse(width/2, height/2, 450, 450);
  fill(0, 0, 210);
  ellipse(width/2, height/2, 400, 400);
  fill(0, 0, 300);
  ellipse(width/2, height/2, 350, 350);
  fill(0, 0, 50);
  ellipse(width/2, height/2, 300, 300);
  fill(0, 0, 150);
  ellipse(width/2, height/2, 250, 250);
  fill(244);
  ellipse(width/2, height/2, 200, 200);
  fill(0, 0, 0);
  ellipse(width/2, height/2, 150, 150);
  fill(0, 0, 50);
  ellipse(width/2, height/2, 100, 100);
  fill(0, 0, 100);
  ellipse(width/2, height/2, 50, 50);
  fill(0, 0, 200);
  ellipse(width/2, height/2, 10, 10);
  fill(0, 0, 244);
  
  
  

  calcWave();
  renderWave();
}

void calcWave() {

  theta  -= -1;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  stroke(0);
  strokeWeight(1);
  fill(random(244));
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2-yvalues[x], 15, 15);
  }
}
