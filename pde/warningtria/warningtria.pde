void setup()
{
  size(720,480);
}

void centertriangle(int centerx, int centery, int size)
{
  noFill();
  
  float sizeh = size/2.;
  float xpos1 = sin((PI/180.)*0) * sizeh + centerx;
  float ypos1 = -cos((PI/180.)*0) * sizeh + centery;
  float xpos2 = sin((PI/180.)*-120)* sizeh + centerx;
  float ypos2 = -cos((PI/180.)*-120)* sizeh + centery;
  float xpos3 = sin((PI/180.)*120)* sizeh + centerx;
  float ypos3 = -cos((PI/180.)*120)* sizeh + centery;
  triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
  //circle(centerx, centery, size);
  //circle(cos(frameCount*0.1)*sizeh+centerx, sizeh, 20);
}

void draw()
{
  background(0);
  int triangles = min(frameCount*4, 2000);
  for (int i=-150;i<triangles;i+=16)
  {
    float delta = max(0, sin(i*0.005+frameCount*-0.05)*200-100);
    //int size = i + (frameCount % 16)+ int(delta);
    int size = i + int(delta);
    strokeWeight(1);
    if (size > 0)
    {
      stroke(255);
      if (i > 430)
      {
        stroke(255,0,0);
      }
      if (i > 540)
      {
        stroke(#9B5DE5);
      }
      centertriangle(width/2+int(random(-5,5)), 320, size);
    }
  }
}
