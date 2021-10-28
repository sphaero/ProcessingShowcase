

static final int lijnen = 10;

float t;




void setup() {
  background (20);
  size(720, 480);
}

void draw() {
    background (20);
    
    
      float bms= 140/60000;
  float fms= 1000/60;
  float framesInBeat = bms/fms;
  println (int(framesInBeat));
  if ( frameCount % 50 < 10 )
  
   rect(frameCount * 100 % width, random(400), cos(frameCount*0.8) *300 +190, random(720));
  fill(244);
  stroke(244);
  strokeWeight(3);
  
   fill(0);
  strokeWeight(10);
  ellipse(frameCount * 50 % width, frameCount * 10% height, cos(frameCount*0.03) *40 +80, cos(frameCount*0.03) *200 +40);
 
      
  
  fill(244);
  stroke (244); 
  strokeWeight(6);

  translate (width/2, height/2);
  

  
  for (int i =0; i < lijnen; i++) {
  line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
  fill(0,244,0);
}
  t++;

}

float x1 (float t) {
  return sin(t / 30) *100 + sin (t/5) *250;
}

float y1 (float t) {
  return cos(t / 10) *100;
}

float x2 (float t) {
  return sin(t / 10) *200 + sin (t/5) *2;
}

float y2 (float t) {
  return cos(t / 20) *200 + cos (t /24) * 20;
}
