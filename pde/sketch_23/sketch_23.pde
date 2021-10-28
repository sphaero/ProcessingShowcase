void setup() {
  size(720, 480);
  noFill();
  stroke(255);
  strokeWeight(12);
  rect(20, 80, 220, 220, 28);
}
float t = 0;
void draw() {
  background(0);
  translate(width / 2, height /2);
   stroke(255, 255, 255);
  strokeWeight(3); 
  beginShape();

  for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
    float rad = r(theta, 
      2, // a (size)
      9, // b
      8, // m (low value: rond, high value:spikey)
      cos(t) - 9, // n1 (low value: rond klein, high value: groot/spikey)
      sin(t) - 12, // n2 (beetje rond)
      2 // n3 (beetje puntig)
      );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }

  endShape();
  
  stroke(0, 153, 255);
  strokeWeight(12);
  beginShape();

  for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
    float rad = r(theta, 
      2, // a (size)
      2, // b
      6, // m (low value: rond, high value:spikey)
      cos(t) * 2 + 30, // n1 (low value: rond klein, high value: groot/spikey)
      cos(t) * 1 + 0.5, // n2 (beetje rond)
      (t) - 1// n3 (beetje puntig)
      );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }

  endShape();
  

  t += 0.9;
}


//polar cooridinates function superformula
float r (float theta, float a, float b, float m, float n1, float n2, float n3 ) {
  return pow (pow(abs(cos(m * theta /4.0) / a), n2) +
    pow (abs(sin(m * theta /4.0) / b), n3), -1.0 /n1);
}
