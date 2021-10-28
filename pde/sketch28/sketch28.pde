void setup() {
  int teller = 0;
  size(720,480);
  stroke(300, 300, 300);
  strokeWeight(2);
}

float t = 0; 
void draw()
{
  background(0);
  
  translate(width / 2, height / 2);
  
 int teller = 0;
float delta = 0;


 if (frameCount % 9 < 2)
 background(200,90, teller);
 
 
  
 
  
  teller = teller + 5; 
    fill(21,30,20,300);
  
  delta = delta + 3;
  if (teller > width ) 
//println(teller);
teller = 0;

  
  beginShape();
  for (float theta = 0; theta <= 2 * PI; theta += 0.01){
    float rad = r(theta,
    1,
    1,
    30,
    1,
    sin(t) * 0.5 + 0.5, //snelheid
    cos(t)  + 0.5
    );
    float x = rad * cos(theta) * 60;
    float y = rad * sin(theta) * 60;
    vertex(x, y);
 
    
  }
  endShape();
  t += 0.1;
  
  beginShape();
  for (float theta = 0; theta <= 2 * PI; theta += 0.01){
    float rad = r(theta,
    5,
    3,
    20,
    1,
    sin(t) * 3 + 0.5, //snelheid
    cos(t)  * 3 + 0.5
    );
    float x = rad * cos(theta) * 60;
    float y = rad * sin(theta) * 60;
    vertex(x, y);
    
 
    
  }
  endShape();
  t += 0.1;
  
  
}


float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) +
  pow(abs(sin(m * theta / 4.0) / b), n3),1.0 / n1);
  
}
