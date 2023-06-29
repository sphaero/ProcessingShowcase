// Tjerk

int count = 1;
int count2 = 30;
int xspeed = 5;
int xspeed2 = 30;
int angle = 1;
// int r1 = 350; //range random size


void setup()
{
  size(720, 480);
}

void draw()
{
  background (96);
  {
    
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(angle));
  strokeWeight(int(random(10)));
  blokje1(100, 50);
  popMatrix();
  
  pushMatrix();
  rectMode(CENTER);
  translate(width/2 + 100, height/2 + 100);
  rotate(radians(angle * -1));
  strokeWeight(int(random(10)));
  blokje1(100, 50);
  popMatrix();
  angle += 5;
  
  pushMatrix();
    rectMode(CENTER);
    blokje1(width/2, height/2);
  popMatrix();
    
    blokje2(0, height* 3/4);
    blokje2(0, height* 1/4);
    //rectMode(CENTER);
    blokje3(80, 255, 113, 52);
    blokje3(150, 255, 219, 88);
  }
  
  /*
  rect(100, 100, 100, 100);
   fill(50, 50, 50);*/
}

void blokje1(int xpos1, int ypos1)
{
  fill(235, 215, 168);
  rect(xpos1, ypos1 + ((count - 250)* 2), 200, 100);
  {


    if (count > height || count < 0)     
    {
      xspeed = xspeed * -1;
    }
    count = count + xspeed;
  }
}

/*
void blokje2(int xpos2, int ypos2, int count2, int xspeed2)
{
  fill(100, 123, 0);
  rect(xpos2 + count2 * -1, ypos2, 250, 40);
  {
    if (count2 > width || count2 < 0)       
    {
      xspeed2 = xspeed2 * -1;
    }
    count2 = count2 + xspeed2;
  }
}
*/

void blokje2(int xpos2, int ypos2)
{
  fill(100, 123, 0);
  rect(xpos2 + count2, ypos2, 250, 40);
  {
    if (count2 > width || count2 < 0)       
    {
      xspeed2 = xspeed2 * -1;
    }
    count2 = count2 + xspeed2;
  }
}

void blokje3(float r1, int rood, int groen, int blauw)
{
  fill(rood, groen, blauw);
  rectMode(CENTER);
  rect((width/2 +int(random (r1 * -1, r1))), (height/2 +int(random (r1 * -1, r1))), int(random (r1)), int(random (r1)));
}
