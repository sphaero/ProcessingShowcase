
void setup() {
  size(720, 480);
   background(0,225,102);
 }

void draw() {
    
  translate(width/2, height/2);
 
float mag = 400;
float s =  5;
noStroke();
for (int i = 0; i < 100; i++ ){
float w = map(sin(radians(frameCount)), -1 ,1,-100,100);
float wave1 = map(tan(radians(frameCount*0.8+ i + w)), -1,1,-100,100);
float wave2 = map(tan(radians(frameCount + i)), -1,1,-mag,mag);
float c = map (sin(radians(frameCount * 5 + i)), -1,1,29,224);
fill (c);
rect (wave1, wave2, s,s);
  }
}
