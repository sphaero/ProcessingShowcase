import procmod.*;

String nicks = "- lara - Lili - Mulamoes - ohokhaha - Ammie - Lilo - Ellie - biceppapi - panlat - Totti - sp4tad3r - yarikanari - Juliavocado - Marnie - Mizzle - Yecatzs - LukeWarmMayonnaise - Sabi - Juicy L. - Krullenbos - supr.tom  - meddelaif - REDNEOB - Sphaero -";
ModPlayer plr;

int start = 0;
int cSamplePlayed = 0;
float intromult = 0.3;
float intromultdelta = 0.0;

color circleFillCol = color(42,247,2);
color circleBorderCol = color(22,129,1);
color noiseCol = color(3,255,243);

PFont fnt;
PFont fnt2;
PFont fnt3;

void setup()
{
  size(720,480);
  frameRate(30);
  background(0);
  plr = new ModPlayer(this, "1995-house-megamix.mod");
  plr.play();
  fnt = createFont("ProggyCleanSZ.ttf", 64);
  fnt2 = createFont("ProggyCleanSZ.ttf", 128);
  fnt3 = createFont("ProggyCleanSZ.ttf", 256);
}

void draw() {
  background(0);
  // noise op de achtergrond die van kleur veranderd
  bgNoise();
  // moving circles op een instrument reageren
  // zwart fade-in frame aan het begin
  fill(0,0,0,255-(frameCount)*4);
  noStroke();
  rect(0,0,width,height);
  
  scrollText();
  // variabelen om op de instrumenten te reageren
  /*if (intromult > 0.3 && intromultdelta > 0)
  {
    intromult += intromultdelta;
  }*/
  intromult += intromultdelta;
  if (cSamplePlayed == 1)
  {
    intromultdelta = +0.04;
    cSamplePlayed = 0;
  }
  if (intromult > 1.3 && intromultdelta > 0)
  {
    intromultdelta = -0.01;
  }
  if (intromult < 0.3)
  {
     intromult = 0.3;
     intromultdelta = 0.0;
  }
  if( frameCount > 100)
  {
    fill(0,0,0,0+(frameCount-100));
    noStroke();
    rect(0,0,width,height);
  }
  if( frameCount > 100 + 255)
  {
    System.exit(0);
  }
}

void bgNoise()
{
  int dx = width/50;
  int dy = height/50;
  noStroke();
  for (int x = 0; x < width; x+=dx) {
    for (int y = 0; y < height; y+=dx) {
      int red = noiseCol >> 16 & 0xff;
      int green = noiseCol >> 8 & 0xff;
      int blue = noiseCol >> 0 & 0xff;
      red = int((red + random(0, 150)) * intromult);
      green = int((green + random(0, 200)) * intromult);
      blue = int((blue + random(-100, 0)) * intromult);
      //println(red, green, blue, intromult);
      fill(red, green, blue);
      rect(x,y,dx-2,dx);
    }
  }
}


void scrollText()
{
  stroke(0);
  strokeWeight(1.0);
  fill(240);
  textFont(fnt);
  text(nicks, 800 - (frameCount%2000*8), height/2);
  fill(248);
  textFont(fnt2);
  text(nicks, 1200 - (frameCount%2000*16), height/2+64);
  fill(255);
  textFont(fnt3);
  text(nicks, 1600 - (frameCount%2000*32), height/2+192);
}

void modRowEvent(int chan, int instr, int note)
{
  if( instr != 0 ) println(instr);
  if (chan == 0 && instr == 12)
  {
    cSamplePlayed = 1;
    start = frameCount;
  }
}
