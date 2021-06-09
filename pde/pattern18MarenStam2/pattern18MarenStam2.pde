void setup() {
  size(720, 480);
  stroke(1,186,239);
  strokeWeight(40);
}
int mijnteller=0;
void draw() {
  background(61, 220, 151);
  // een teller die herhaalt van 0 tot 100
  float teller = mijnteller %20;
  // een diameter voor de cirkel obv de teller
  float diameter = teller * 10.2;
  // een kleur op basis van de teller
  fill(270, teller * 4, 0);
color inside = color(255, 0, 127);
color middle = color(1, 186, 239);
color outside = color(70, 35, 122);

 
  ellipse(width/5, height/7, diameter, diameter);
  mijnteller=mijnteller+1;
  ellipse(width/1, height/3, diameter, diameter);
  mijnteller=mijnteller+1;
  ellipse(width/2, height/1, diameter, diameter);
  mijnteller=mijnteller+1;
  ellipse(width/14, height/1, diameter, diameter);
  mijnteller=mijnteller+2;
  ellipse(width/1, height/1, diameter, diameter);
  mijnteller=mijnteller+1;
  ellipse(width/2, height/2, diameter, diameter);
  mijnteller=mijnteller+1;

  
}
