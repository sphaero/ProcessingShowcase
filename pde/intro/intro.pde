import procmod.*;

ModPlayer plr;

int start = 0;
int introSamplePlayed = 0;
int chorusSamplePlayed = 0;
float intromult = 0.1;

color circleFillCol = color(42,247,2);
color circleBorderCol = color(22,129,1);
color noiseCol = color(3,255,243);

PFont fnt;

void setup()
{
  size(720,480);
  frameRate(30);
  background(0);
  plr = new ModPlayer(this, "1995-house-megamix.mod");
  plr.play();
  fnt = createFont("ProggyCleanSZ.ttf", 128);
}

void draw() {
  background(0);
  if (start > 0)
  {
    // noise op de achtergrond die van kleur veranderd
    bgNoise();
    // moving circles op een instrument reageren
    drawMovingCircle(width/2, height/2, 5);
    // zwart fade-in frame aan het begin
    fill(0,0,0,255-(frameCount-start)*4);
    noStroke();
    rect(0,0,width,height);
    
    scrollText();
  }
  // variabelen om op de instrumenten te reageren
  if (intromult > 0.3)
  {
    intromult -= 0.0027;
  }
  if (introSamplePlayed == 1)
  {
    intromult = 1.3;
    introSamplePlayed = 0;
  }
  if (chorusSamplePlayed == 1)
  {
    tsMovingCirclesStart = frameCount;
    chorusSamplePlayed = 0;
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

int tsMovingCirclesStart = -10000;
void drawMovingCircle(int xpos, int ypos, int amount)
{
  xpos = xpos+int((sin(frameCount*0.157)*60));
  ypos = ypos+int((cos(frameCount*0.157)*60));
  for (int i=0;i<amount;i++)
  {
    int step = frameCount - tsMovingCirclesStart - (i*5);
    if ( step > 0)
    {
      float radius = 0.7 * pow(step, 2);
      noFill();
      strokeWeight(radius*0.1);
      stroke(circleBorderCol);
      ellipse(xpos, ypos, radius*0.9, radius*0.9);
      strokeWeight(radius*0.08);
      stroke(circleFillCol);
      ellipse(xpos, ypos, radius*0.9, radius*0.9);
    }
  }
}

void scrollText()
{
  stroke(0);
  strokeWeight(1.0);
  fill(255);
  textFont(fnt);
  text("Rigid Tinkerer", 800 - ((frameCount-start)*3), height/2+16);
}
void modRowEvent(int chan, int instr, int note)
{
  if( instr != 0 ) println(instr);
  if (chan == 0 && instr == 13)
  {
    introSamplePlayed = 1;
    start = frameCount;
  }
  if (instr == 2)
  {
    chorusSamplePlayed = 1;
  }
}
