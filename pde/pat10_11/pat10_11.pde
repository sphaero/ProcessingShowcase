void setup(){
    loadSounds(10,11); //begin en eindpositie
    int teller=1;
    size (640,360);
}

int sq_size = 20;
int x_pos, y_pos;



void draw() {
  playSounds();
  int teller=1;
   x_pos = int(random(0, width));
    y_pos = int(random(0, height));
  background(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  line(1, 230, 1000, 230);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  line(1, 130, 1000, 130); 
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  line(180, 1, 180, 1000);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  line(50, 230, 50, 1000);
  fill(192);
  line(310, 230, 310, 1000);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  line(180, 350, 310, 350); 
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,180,130);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(0,230,x_pos, y_pos);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,130,120);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,180,130);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(0,230,x_pos, y_pos);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,130,120);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,180,130);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(0,230,x_pos, y_pos);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,130,120);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  rect(x_pos, y_pos,180,130);
  fill(86);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  ellipse(0,230,x_pos, y_pos);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  ellipse(x_pos, y_pos,130,120);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  ellipse(x_pos, y_pos, sq_size, sq_size);
  fill(115);
  ellipse(x_pos, y_pos, sq_size, sq_size);
  fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
  ellipse(x_pos, y_pos, sq_size, sq_size);
  teller=teller+1;
  while (teller<=50) {
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
    rect(x_pos, y_pos, sq_size, sq_size);
    teller=teller+1;
  }
  while (teller<=50) {
    x_pos = int(random(0, width));
    y_pos = int(random(0, height));
    fill(int(random(0,255)), int(random(0,255)), int(random(0,255)));
    ellipse(x_pos, y_pos, sq_size, sq_size);
    teller=teller+1;
  }
}
