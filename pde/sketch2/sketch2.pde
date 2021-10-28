void setup()
{
  size (720,480);
  println("opgestart");
}

int roze = (#F08080);
int blauw = #40E0D0;

float angle = 0;
float a = 0.0;
float s = 0.0;
float c = cos(angle);

  


void draw() {
  // hoe ver uit elkaar
  a = a +0.02;
  // hoe groot
  s = cos (a)*0.8;
  
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  fill(roze);
  triangle(18, 18, 18, 360, 81, 360);
  fill(roze);
  ellipse(width/2,height/2,50,50);
  fill(blauw);
  ellipse(width/2,height/2,50,50);
  angle = angle +3.5;
  
}
