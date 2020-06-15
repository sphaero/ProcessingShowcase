
import procmod.*;

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 4;   // total # of waves to add together

int blauw = (#2A2EE8);
int roze = #F0278B;

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)

ModPlayer mplayer;

//(#2A2EE8) (#F0278B)//

void setup() {
  size(720, 480);
  colorMode(#2A2EE8);
  background(#F0278B) ;
  theta = 0.0;
  
    mplayer = new ModPlayer(this, dataPath("patt4.mod"));
  //  play it rightaway
  mplayer.play();
  
  w = width + 20;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(100,100);
    float period = random(900,900); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(#2A2EE8);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.50;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  noStroke();
  fill(#F0278B);
  ellipseMode(CENTER);
  for (int x = 5; x < yvalues.length; x++) {
    ellipse(x*xspacing,height/2+yvalues[x],5000,5);
  }
}
