int count = 0;
int ypos = 0;
int ydelta = 20;
int ypos2 = 0;
int ydelta2 = 50;

void setup(){
  size(720, 480);
}

void draw(){
  strobe(4);
  movingBlank(ypos = ypos+ydelta);
  movingCircle(ypos2 = ypos2+ydelta2);
}

void strobe(int freq){
  count = count+1;
  if (count == freq){
    background(255);
    count = 0;
  }
  else{
    background(random(0, 255), random(0, 255), random(0, 255));
  }
  //println(count);
}

void movingBlank(int ypos){
  ypos = ypos+ydelta;
  if(ypos >= height*3){
    ydelta = ydelta*-1;
  }
  if(ypos<=-height*1.5){
     ydelta = ydelta*-1;
  }
  fill(255);
  noStroke();
  delay(50);
  rectMode(CENTER);
  rect(width/2, ypos, 720, 720);
}

void movingCircle(int ypos2){
  ypos2 = ypos2+ydelta2;
  if(ypos2 >= height+100){
    ydelta2 = ydelta2*-1;
  }
  if(ypos2<=-100){
    ydelta2 = ydelta2*-1;
  }
  fill(0, 0, 100);
  noStroke();
  ellipse(width/2, ypos2, 100, 100);
}
