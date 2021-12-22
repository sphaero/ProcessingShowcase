int clock = 0;
int ypos = 0;
int yspeed = 15;
int xpos = 0;
int xspeed = 15;
int size = 10;
int growth = 1;

int sq_size = 3;
int x_pos, y_pos;



void setup()
{
  size(720,480);
  background(0);
  loadSounds(1,3);
  
}

void draw()
{
  playSounds();
  
  
    noStroke();
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)),0, int(random(0, 255)));
    rect(x_pos, y_pos,size,size);
    clock=clock+1;
  
  
  clock = clock+1;
  
  size = size + growth;
  if (size >= 200)
  {
    growth = growth * -1;
  }
  if (size <= 0)
  {
    growth = growth * -1;
  }
  
  ypos = ypos + yspeed;
  if (ypos >= height)
  {
    yspeed = yspeed * -1;
  }
  if (ypos <= 0)
  {
    yspeed = yspeed * -1;
  }
  
  
  xpos = xpos + xspeed;
  if (xpos >= width)
  {
    xspeed = xspeed * -1;
  }
  if (xpos <= 0)
  {
    xspeed = xspeed*-1;
  }
  
  //vormen
  
  //rect(xpos,ypos,size-20,size-20);
  
  circle(width/2,height/2,size+60);
  
  circle(width*0.25,height/2,size+10);
  
  circle(width*0.75,height/2,size+10);
  
  //rect(width-xpos,ypos,size-10,size-10);
  
  //rect(xpos,height-ypos,20,20);
  
  //rect(width-xpos,height-ypos,10,10);
  
  textSize(22);
  fill(int(random(0, 255)),0, int(random(0, 255)));
text("YOU ARE NOW ENTERING THE FUNKY DIMENSION", width*0.08,height*0.5);
  
  
}
