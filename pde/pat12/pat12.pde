int ranges = 100;
color c1 = #808000;
color c2 = #FF7034;
color c3 = #FFDB58;
color c4 =  #EBD7A8;
color[] colors = {c1, c2, c3, c4};
int count = 0;

void setup() {
  size(720, 480);
}

void draw() {
  count += 1;
  if(count  == 3){
    count = 0;
  }
  
  noFill();
  strokeWeight(2);

  for (int i = 0; i < ranges; i++) {
    stroke(colors[count]);
    
    beginShape();
    for (int x = -10; x < width + 11; x += 20) {
      float n = noise(x * 0.001, i * 0.01, frameCount * 0.02);
      float y = map(n, 0, 1, 0, height);
      vertex(x, y);
    }
    endShape();
  }
}
