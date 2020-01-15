int x_pos = 0;
int y_pos = 0;
int x_delta = 5;
int y_delta = 3;

void setup(){
  size(720, 480);
  background(255);
}

void draw(){
  x_pos = x_pos+x_delta;
  y_pos = y_pos+y_delta;
  //background(255);
  //fill(110, 180, 250);
  rect(x_pos, y_pos, 50, 50);
  if(y_pos>=(height-50)||y_pos==0){
    background(random(0, 255), random(0, 255), random(0, 255));
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(x_pos, y_pos, 50, 50);
    y_delta = y_delta*-1;
  }
  if(x_pos>=(width-50)||x_pos==0){
    background(random(0, 255), random(0, 255), random(0, 255));
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(x_pos, y_pos, 50, 50);
    x_delta = x_delta*-1;
  }
}
