// Pattern 5 
// Sjoerd van Huijgevoort

void setup()

{

size(720, 480);

background(0,0,255);

}

void draw ()

{

translate (width/2, height/2);

float mag = 50;

float s = 35;

for (int i = 0 ; i < 600; i++) {

float w = map(sin(radians(frameCount)),-1,1,-350,350);

float wave1 = map(cos(radians(frameCount*0.6+ i - w)),-1,1,-350,350);

float wave2 = map(tan(radians(frameCount+i)),-1,1,-mag,mag);

float c = map (sin(radians(frameCount*3)),-1,1,0,255);

fill (c);

noStroke();

ellipse(wave1,wave2,s,s);

}

}
