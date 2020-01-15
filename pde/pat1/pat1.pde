int clock = 0;
int ypos = 0;
int yspeed = 15;
int xpos = 0;
int xspeed = 15;

int colorspeed = 10;
int kleurrood = 255;
int kleurgroen = 0;

void setup()
{
  size(640,360);
  background(0);
  
}

void draw()
{
  
  
  ypos = ypos + yspeed;
  if (ypos >= height)
  {
    yspeed = yspeed * -1;
  }
  if (ypos <= 0)
  {
    yspeed = yspeed*-1;
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
  
  
  
  kleurrood = kleurrood - colorspeed;
  if (kleurrood <= 0)
  {
    colorspeed = colorspeed * -1;
  }
  if (kleurrood >= 255)
  {
    colorspeed = colorspeed * -1;
  }
  
  
  kleurgroen = kleurgroen + colorspeed;
  if (kleurgroen <= 0)
  {
    colorspeed = colorspeed * -1;
  }
  if (kleurgroen >= 255)
  {
    colorspeed = colorspeed * -1;
  }
  
  
  
  
  fill(kleurrood,kleurgroen,255);
  rect(5,ypos,100,100);
  
  fill(kleurgroen,kleurrood,255);
  rect(110,height-ypos,100,100);
  
  fill(kleurrood,kleurgroen,255);
  rect(215,ypos,100,100);
  
  fill(kleurgroen,kleurrood,255);
  rect(325,height-ypos,100,100);
  
  fill(kleurrood,kleurgroen,255);
  rect(430,ypos,100,100);
  
  fill(kleurgroen,kleurrood,255);
  rect(535,height-ypos,100,100);
  
  fill(kleurrood,kleurgroen,255);
  ellipse(xpos,ypos,100,100);
  
  fill(kleurgroen,kleurrood,255);
  ellipse(width-xpos,height-ypos,100,100);
  
  clock = clock+1;
  println(clock);
  
  //windows error text
  
  if (clock >= 200)
  {
    rect(width-(clock-100),0,5,360);
    
    noStroke();
  fill(255);
  rect(5,5,200,5);
  }
  
  if (clock >= 220)
  {
    fill(255);
    rect(5,15,150,5);
  }
  
  if (clock >= 240)
  {
    fill(255);
    rect(5,25,180,5);
  }
  
  if (clock >= 260)
  {
    fill(0,0,255);
    rect(width-(clock-200),0,5,360);
    fill(255);
    rect(5,35,150,5);
  }
  
  if (clock >= 280)
  {
    fill(255);
    rect(5,45,120,5);
  }
  
  if (clock >= 300)
  {
    
    textSize(32);
text("Fatal Windows Error", width*0.25,height/2);
    
    
    fill(255);
    rect(5,70,130,5);
  }
  
  if (clock >= 320)
  {
    fill(255);
    rect(5,80,60,5);
  }
  
  if (clock >= 340)
  {
    fill(255);
    rect(5,90,80,5);
  }
  
  if (clock >= 360)
  {
    fill(255);
    rect(5,100,50,5);
  }
  
  if (clock >= 380)
  {
    fill(255);
    rect(5,100,50,5);
  }
  
  if (clock >= 400)
  {
    fill(255);
    rect(5,115,100,5);
    
  textSize(32);
text("Shutting down in 3", width*0.25,height*0.75);
  }
  
  if (clock >= 420)
  {
    fill(255);
    rect(5,125,70,5);
  }
  
  if (clock >= 440)
  {
    fill(255);
    rect(5,135,50,5);
  }
  
  if (clock >= 450)
  {
    fill(0,0,255);
  rect(width*0.25,height*0.60,400,50);
  
  textSize(32);
  fill(255);
text("Shutting down in 2", width*0.25,height*0.75);
  }
  
  if (clock >= 500)
  {
     fill(0,0,255);
  rect(width*0.25,height*0.60,400,50);
    
  textSize(32);
  fill(255);
text("Shutting down in 1", width*0.25,height*0.75);
  }
  
  //if (clock >= 550)
  ////{
  ////fill(0,0,255);
  ////rect(width*0.25,height*0.60,400,50);
    
  ////textSize(32);
  ////fill(255);
  ////text("Shutting down in 0", width*0.25,height*0.75);
  ////}
  if (clock >= 550)
  {
  fill(255);
  rect(0,0,640,360);
  }
  
  if (clock >= 555)
  {
  fill(0);
  rect(0,0,640,360);
  }
  
  if(clock >= 600)
  {
      noStroke();
    int  x_pos = int(random(0, width));
    int y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0, 255)));
    rect(x_pos, y_pos, 10, 10);
  }
  
  //skull
  //if (clock >= 600)
  //{
  //  fill(255);
  //  circle( width/2, height/3, 100);
  //  rect(width*0.46,height/3+20,50,50);
    
  //  fill(0);
  //  circle(width/2-30,height/3+5,30);
  //  circle(width/2+30,height/3+5,30);
  //  triangle(width/2,height*0.4,width/2-10,height*0.45,width/2+5,height*0.45);
    
  //  fill(255,0,0);
  //  circle(width/2-30,height/3+5,10);
  //  circle(width/2+30,height/3+5,10);
    
  //}
}






  
  
  
