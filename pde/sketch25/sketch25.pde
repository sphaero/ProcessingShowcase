float xpos;
float ypos;
float vierkantRichting = 0;

void setup() {
  size(720, 480);
  xpos = width/2;
  ypos = height/2;
  background(0);
}

void draw() {

  stroke(255);
  
  rotateVierkant(random(360));
  float length = random(0, 250);
  
  forward(length);
  rotateVierkant(90);
  
  forward(length);
  rotateVierkant(90);
  
  forward(length);
  rotateVierkant(90);
  
  forward(length);
}

void forward(float i) 
{
  
  float newX = xpos + cos(radians(vierkantRichting)) * i;
  float newY = ypos + sin(radians(vierkantRichting)) * i;

  line(xpos, ypos, newX, newY);
  fill(0);
  
  xpos = newX;
  ypos = newY;
}

void rotateVierkant(float degrees) {
  vierkantRichting += degrees;
}
