import procmod.*;
ModPlayer mplayer;
int totalPts = 600;
float diameter;
float angle = 0;
float angle2 =0;
float angle3 =0;


int xspacing = 8; // How far apart should each horizontal location be spaced
int w; // Width of entire wave
int maxwaves = 4; // total # of waves to add together

int blauw = (#2A2EE8);
int roze = #F0278B;

float theta = 0.0;
float[] amplitude = new float[maxwaves]; // Height of wave
float[] dx = new float[maxwaves]; // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues; // Using an array to store height values for the wave (not entirely necessary)


void setup() {
size(720, 480);
stroke(255);
mplayer = new ModPlayer(this, dataPath("patt5.mod"));
mplayer.play();
diameter = height - 10;
noStroke();

frameRate(60);
colorMode(#2A2EE8);
background(#F0278B) ;

w = width + 20;

for (int i = 0; i < maxwaves; i++) {
amplitude[i] = random(100,100);
float period = random(900,900); // How many pixels before the wave repeats
dx[i] = (TWO_PI / period) * xspacing;
}

yvalues = new float[w/xspacing];

}

void draw() {

background(roze);

fill(blauw);
float d4 = 10 + (sin(angle + PI/2) * diameter/0.5) + diameter/0.5;
ellipse(width/2, height/2, d4, d4);
angle += 0.23;


//links
fill(roze);
float d1 = 10 + (sin(angle2) * diameter/1) + diameter/1;
ellipse(width/2, height/2, d1, d1);
angle2+=0.23;

//midden
fill(blauw);
float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
ellipse(width/2, height/2, d2, d2);
angle += 0.23;

fill(roze);
float d3 = 10 + (sin(angle3 + PI) * diameter/2) + diameter/2;
ellipse(width/2, height/2, d3, d3);
angle3 += 0.23;


calcWave();
renderWave();


}

void calcWave() {
// Increment theta (try different values for 'angular velocity' here
theta += 0.30;

// Set all height values to zero
for (int i = 0; i < yvalues.length; i++) {
yvalues[i] = 0;
}

// Accumulate wave height values
for (int j = 0; j < maxwaves; j++) {
float x = theta;
for (int i = 0; i < yvalues.length; i++) {
// Every other wave is cosine instead of sine
if (j % 2 == 0) yvalues[i] += sin(x)*amplitude[j];
else yvalues[i] += cos(x)*amplitude[j];
x+=dx[j];
}
}
}

void renderWave() {
// A simple way to draw the wave with an ellipse at each location
noStroke();
fill(#2A2EE8);
ellipseMode(CENTER);
for (int x = 0; x < yvalues.length; x++) {
ellipse(x*xspacing,height/2+yvalues[x],200,50);
}
}
