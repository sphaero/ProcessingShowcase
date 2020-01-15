

Drop[] drops = new Drop[500];
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};

void setup(){
 size(720,480);
 noStroke();
 for (int i = 0; i <drops.length; i++) {
   drops[i] = new Drop();
 }
}

void draw(){
  //achtergrond
  background(darkblue,125);
  fill(red,130);
  rect(0,0,720,480);
  noStroke();
  //grond
  fill(darkblue);
  rect(0,240,720,400);
  //huis
  color mix = lerpColor(red,midblue,0.5);
  fill(mix);
  quad(150,200,200,240,200,350,150,320);
  triangle(150,200,175,170,200,240);
  quad(200,200,360,200,360,360,280,350);
  triangle(190,200,300,140,360,200);
  fill(red);
  rect(200,230,85,120);
  rect(360,200,240,160);
  //dak
  fill(darkblue);
  quad(175,170,245,170,290,240,200,240);
  quad(300,140,550,140,600,200,360,200);
  
  
  

  
  
  
  for (int i = 0; i < drops.length; i++) {
  drops[i].fall();
  drops[i].show();
  }
}
