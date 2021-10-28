void setup(){
size(720, 480);

noFill();
stroke(255);
strokeWeight(2);
}

void draw() {
  background(0);
  
  translate(width / 2, height /2);
  beginShape();
  
  for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
    float rad = r(theta,
    2, // a (size)
    2, // b
    6, // m (low value: rond, high value:spikey)
    1, // n1 (low value: rond klein, high value: groot/spikey)
    1, // n2 (beetje rond)
    1 // n3 (beetje puntig)
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);  
  }
  
  endShape();
}

//polar cooridinates function superformula
float r (float theta, float a, float b, float m, float n1, float n2, float n3 ) {
  return pow (pow(abs(cos(m * theta /4.0) / a), n2) +
  pow (abs(sin(m * theta /4.0) / b), n3), -1.0 /n1);
  
}
