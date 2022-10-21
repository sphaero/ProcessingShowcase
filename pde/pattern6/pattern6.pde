//pattern6

void setup()


{

size(720, 480);

background(0,0,0);

}

void draw ()

{
float speed = 0.26;
speed = 100/(mouseX+5);

float delta = (5.2 +sin(frameCount*speed))*15;


translate (width/2, height/2);
for (int y = 0; y < height; y+=width/6);

float mag = 10;

float s = 35;

for (int i = 0 ; i < 500; i++) {


float wave1 = map(cos(radians(frameCount*6+ i)),-1,1,-350,350);

float wave2 = map(tan(radians(frameCount*1.5+i)),-1,1,-mag,mag);

float c = map (sin(radians(frameCount*1.6)),1,-1,0,255);

fill (c);

noStroke();

ellipse(wave1,wave2,delta,delta);

}
}
