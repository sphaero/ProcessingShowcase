Star[] stars = new Star[1000];



void setup() {
  size(720,480);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }   
}

void draw() {
    background(243, 167, 18);
    translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i] .update();
    stars[i] .show();
}  
}
