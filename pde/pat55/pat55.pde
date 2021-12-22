//based on https://twitter.com/ntsutae/status/1216012181415714819
float C=0, M, W=720;
void setup() {
  size(720, 480);
  stroke(#0019FF);
  M=W/2;
}
void draw() {
  clear();
  background(#000000);
      if ( int(millis() % 416.6666) < 20 ) {
     stroke(#0AFF23);
   }
  C+=3;
  rotate(PI);
  translate(-W, -W);
  for (float i=-M; i<W; i++) {
    float n=noise((i+C)*.01)-.5;
    strokeWeight(map( constrain(n, 0, 1), 0, 1, 5, 300));
    push();
    translate(W/2, i);
    scale(0.5, .0255);
    rotate(n*1.4);
    line(-W/2-M, i, W/2+M, i);
    pop();
  }
}
