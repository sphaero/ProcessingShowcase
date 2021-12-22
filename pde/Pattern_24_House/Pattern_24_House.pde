
Drop[] drops = new Drop[500];
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};
color light;


void setup(){
 size(720,480);
 noStroke();
 for (int i = 0; i <drops.length; i++) {
   drops[i] = new Drop();
  
 }
}

void draw(){
   background(0);
   


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
  quad(90,210,180,240,180,360,90,330);
  triangle(90,210,135,150,180,240);
  quad(225,150,360,180,360,390,270,360);
  triangle(225,150,300,60,360,180);
  fill(red);
  rect(180,240,90,120);
  rect(360,210,270,180);
  //dak
  fill(darkblue);
  quad(135,150,225,150,270,240,180,240);
  quad(300,60, 540,60, 630,210, 360,210);
  //details
  quad(115,240, 135,245, 135,295, 115,285);
  quad(295,230, 335,235, 335,355, 295,350); 
  quad(385,245, 425,245, 425,365, 385,365);
  quad(574,245, 615,245, 615,365, 575,365);
  //ramen
  light = midblue;
  if ( int(millis() % 416.6666) < 60 ) {
      light = white;
  }
  fill(light);
  quad(120,245, 140,250, 140,300, 120,290);
  quad(300,235, 340,240, 340,360, 300,350);
  quad(380,240, 420,240, 420,360, 380,360);
  quad(570,240, 610,240, 610,360, 570,360);
  //deuren
  fill(darkblue);
  rect(465,260,75,125);
  rect(205,255, 55,105);
  fill(midblue);
  rect(460,270,70,120);
  rect(200,260, 50,100);
  
  //wit detail
  fill(lightblue);
  quad(90,210,135,150,135,155,90,215);
  quad(135,150,180,240,180,245,135,155);
  rect(180,240,90,3);
  quad(225,150, 300,60, 300,65, 225,155);
  quad(300,60, 360,210, 360,215, 300,65);
  rect(360,210, 270,3);
   
  for (int i = 0; i < drops.length; i++) {
  drops[i].fall();
  drops[i].show();
  }
}
