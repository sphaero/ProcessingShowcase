//startup

void setup()
{
 size(720,480); 
 w = width+500;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
   noStroke();

}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.1;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
 
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) 
  {
ellipse(x*xspacing, height/1.6+yvalues[x], 40, 40);
rect(x*xspacing - 45, height/1.6+yvalues[x] + 20, 90, 20);
rect(x*xspacing - 23, height/1.6+yvalues[x] + 40, 45, 40);
rect(x*xspacing - 23, height/1.6+yvalues[x] + 80, 17, 60);
rect(x*xspacing + 5, height/1.6+yvalues[x] + 80, 17, 60);
rect(x*xspacing - 45, height/1.6+yvalues[x] - 40, 20, 60);
rect(x*xspacing + 25, height/1.6+yvalues[x] - 40, 20, 60);


  }
}

void calcWave2() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.1;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave2() {
 
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) 
  {
ellipse(x*xspacing, height/6+yvalues[x], 40, 40);
rect(x*xspacing - 45, height/6+yvalues[x] + 20, 90, 20);
rect(x*xspacing - 23, height/6+yvalues[x] + 40, 45, 40);
rect(x*xspacing - 23, height/6+yvalues[x] + 80, 17, 60);
rect(x*xspacing + 5, height/6+yvalues[x] + 80, 17, 60);
rect(x*xspacing - 45, height/6+yvalues[x] - 40, 20, 60);
rect(x*xspacing + 25, height/6+yvalues[x] - 40, 20, 60);

  }
}



//setup floats and intergers

int xspacing = 100;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 20.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

float xoff = 0.0;
float xincrement = 0.01; 



//background fill

void draw()
{
  

 
background(1, 106, 136);


//Draw wave
calcWave();
renderWave();
calcWave2();
renderWave2();
 

  
//Set layer blend mode
blendMode(DIFFERENCE);
}
