PFont font;
int ts = 0;
String[] greetz = {
  "Mingo",
  "Get-rekt",
  "Bob",
  "tamhead",
  "lyd",
  "Cavos",
  "chutney",
  "jayjay",
  "Babs",
  "Jo",
  "Glastrid",
  "Mau",
  "C-bass",
  "Ambient",
  "Señor Sauerkraut",
  "hailasses",
  "packman",
  "afwezig",
  "Sphaero",
  "Knip 'n Plak"
};
  
void setup(){
  size(720,480);
  loadSounds(0,0);
  font = createFont("RetrovilleNC.ttf", 64);
}

void draw(){
  float frameC8b = cos(frameCount/100.) * 30 + 50;
  float frameC8g = cos(frameCount/230.) * 30 + 50;
  background(0,frameC8g,frameC8b);
  if (ts == 0) ts = millis(); //time start
  //playSounds();
  
  int bars=0;
  while(bars<10)
  {
    drawBar(cos((bars/5.)+frameCount*0.04)*(height/2)+height/2, 20, new PVector(255,0,bars*25));
    bars++;
  }
  textFont(font);    
  textSize(48);
  textAlign(CENTER);
  fill(0,100,127);
  text("greetz & respect:", width/2, height-frameCount*2); 
  textSize(42);
  for (int i=0;i<greetz.length;i++)
  {
    text(greetz[i], width/2, height-(frameCount*2-(i+2)*64));
  }
  textSize(48);
  fill(200,255,0);
  text("greetz & respect:", width/2-3, height-frameCount*2); 
  textSize(42);
  for (int i=0;i<greetz.length;i++)
  {
    text(greetz[i], width/2-3, height-(frameCount*2-(i+2)*64));
  }
}

void drawBar(float y, float barheight, PVector col)
{
  noStroke();
  y = y - barheight/2;
  PVector gradCol = new PVector(col.x, col.y, col.z);
  gradCol.mult(0.3);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  /*gradCol.mult(1.5);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  */
  fill(col.x, col.y, col.z);
  rect(0, y, width, barheight);
  y+=barheight-4;
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  //gradCol.mult(2/3.);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
}

void keyReleased()
{
  println(millis()-ts);
}
