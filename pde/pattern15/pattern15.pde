// example circle animation manually speed matched to the music
float nextHeight = 480;
int xpoos =0;

void setup()
{
  size(720, 480);
}

void draw()
{
  noStroke();
  background(224,224,224);
  fill(29,29,27);
  rectMode(CENTER);
  rect(width/2,height/2,random(720),random(480));
  float speed = 1;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*100;
  float bigWidth = 100+delta;
  littleCircles(30, nextHeight);
  circle(width/2, height/2, random(30,50));
  fill(255);
  circle(width/2, height/2, bigWidth);

  if (nextHeight < 35)
  {
    nextHeight = 480;
  } else
  {
    nextHeight = nextHeight - 1;
  }
}

void littleCircles(float xPos, float yPos)
{

  fill(0, 225, 102);
  circle(xPos+random(10, 20), yPos, random(50-30));
  circle(xPos+random(640, 650), yPos, random(50-30));

  if (yPos < 460)
  {
    circle(xPos+random(40, 50), yPos+20, random(50-30));
    circle(xPos+random(610, 620), yPos+20, random(50-30));
  }

  if (yPos < 440)
  {
    circle(xPos+random(70, 80), yPos+40, random(50-30));
    circle(xPos+random(580, 590), yPos+40, random(50-30));
  }

  if (yPos < 420)
  {
    circle(xPos+random(100, 110), yPos+60, random(50-30));
    circle(xPos+random(550, 560), yPos+60, random(50-30));
  }
  if (yPos < 400)
  {
    circle(xPos+random(130, 140), yPos+80, random(50-30));
    circle(xPos+random(520, 530), yPos+80, random(50-30));
  }
  if (yPos < 380)
  {
    circle(xPos+random(160, 170), yPos+100, random(50-30));
    circle(xPos+random(490, 500), yPos+100, random(50-30));
  }
  if (yPos < 360)
  {
    circle(xPos+random(190, 200), yPos+120, random(50-30));
    circle(xPos+random(460, 470), yPos+120, random(50-30));
  }
  if (yPos < 340)
  {
    circle(xPos+random(220, 230), yPos+140, random(50-30));
    circle(xPos+random(430, 440), yPos+140, random(50-30));
  }
  if (yPos < 320)
  {
    circle(xPos+random(250, 260), yPos+160, random(50-30));
    circle(xPos+random(400, 410), yPos+160, random(50-30));
  }
  if (yPos < 300)
  {
    circle(xPos+random(280, 280), yPos+180, random(50-30));
    circle(xPos+random(370, 380), yPos+180, random(50-30));
  }
}
