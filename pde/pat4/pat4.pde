float xpos, ypos;
float xspeed = 10 ;
float yspeed = 10.1 ;
int xdirection = 1;
int ydirection = 1;
int rad = 50;
int rect_size=20;
color c1 = #808000;
color c2 = #FF7034;
color c3 = #FFDB58;
color c4 =  #EBD7A8;
color[] colors = {c1, c2, c3, c4};
int count = 0;

void setup() {
  size(720,480);
    
    ellipseMode(RADIUS);
    xpos = width/2;
    ypos=height/2;
   
}

void draw() {
  
 
  
  int random_color = int(random(0,3));

      int totaal = 40;

  for (int x = totaal; x <= width - totaal; x += totaal) {
    for (int y = totaal; y <= height - totaal; y += totaal) {
  
      fill(colors[random_color]);
      rect(x-1, y-1, rect_size, rect_size);
    }
}

  //circle:
  
  // update position of shape:
  xpos = xpos  + (xspeed * xdirection); 
  ypos = ypos + (yspeed * ydirection); 
  
  // y boundaries shape
  if (ypos > height-rad) {
     count += 1;
      if(count  == 3){
       count = 0;
      }
    ydirection *= -1;
    rect_size+=10;
  }
  if (ypos < rad){
    ydirection *= -1;
    rect_size-=20;
    count += 1;
      if(count  == 3){
       count = 0;
      }

  }
  
  // x boundaries shape
  if (xpos > width-rad) {
    xdirection *= -1;
    rect_size+=10;
    count += 1;
      if(count  == 3){
       count = 0;
      }
  }
  if (xpos < rad){
    xdirection *= -1;
    rect_size-=5;
    count += 1;
      if(count  == 3){
       count = 0;
      }
  }

  fill(colors[count]);
  ellipse(xpos, ypos, rad, rad);
  
  
}
