class Spline {
  
  float startX;
  float startY;
  float rotStart;  // General direction of the Spline
    
  int segNum;  // Number of segments
  int segTeller = 0;  // Used to animate the Spline
  float segLen;  // Length of each segment
  float freq;  // Wavyness of Spline
  float ampl;  // Amplitude of Spline
  float thick;  // Thickness at the root of Spline
  int[] col = new int[3];
  color colStart = white;
  color colEnd = red;
  
  
  // CONSTRUCTORS  
  // 1) Test-Constructor
  Spline(float x) {
    startX = x;
    startY = height/2;
    segNum = int(random(20,40));
    segLen = random(7,8);
    freq = random(2);
    ampl = random(-8,8);
    thick = random(10,25);
    rotStart = radians(random(-30,30));
  }
  
  // 2) Main-Constructor
  Spline() {
        
    segLen = random(7,8);
    freq = random(1,2.5);
    int coin = int(random(0,2)); // Simulate a coin flip.
    if (coin == 0){  // Used to keep the amplitude from being zero. Choose either...
      ampl = random(-15,-2);  //...a number between -15 or -2...
    } else {
      ampl = random(2,15);  //...or a number between 2 and 15. (We don't want Roots, that grow straight, right?)
    }
    
    thick = random(10,25);
    
    // Choose random side (top & bottom get 2 numbers each for higher probability)
    int side = int(random(1,7));
    // Depending on the outcome, choose side
    if (side == 1){  // Left side
      rotStart = radians(random(-30,30));
      segNum = int(random(25,55));
      startX = 0;
      startY = random(height);
    } else if (side == 2 || side == 3){  // Top side
      rotStart = radians(random(60,120));
      segNum = int(random(15,35));
      startX = random(width);
      startY = 0;
    } else if (side == 4){  // Right side
      rotStart = radians(random(150,210));
      segNum = int(random(25,55));
      startX = width;
      startY = random(height);
    } else if (side == 5 || side == 6){  // Bottom side
      rotStart = radians(random(240,300));
      segNum = int(random(15,35));
      startX = random(width);
      startY = height;
    }
  }
  
  // 3) Constructer with specific position and direction
  Spline(float tempX, float tempY, String dir) {
    startX = tempX;
    startY = tempY;
    segNum = int(random(25,55));
    segLen = random(7,8);
    freq = random(1,2.5);
    ampl = random(-15,15);
    thick = random(10,25);
    if (dir == "r"){
      rotStart = radians(random(-30,30));
    } else if (dir == "d"){
      rotStart = radians(random(60,120));
    } else if (dir == "l"){
      rotStart = radians(random(150,210));
    } else if (dir == "u"){
      rotStart = radians(random(240,300));
    }
  }
 
  void show()  {
    float x1 = startX;
    float y1 = startY;
    color gradient;
    float part = 1/float(segNum);
  
    pushMatrix();
      translate(x1,y1);  // Go to starting position
      rotate(rotStart);  // Set first (starting) rotation
      for (int i=0; i<segTeller; i++){  // Loop through the Spline until current Teller-Position
        strokeWeight(map(i, segNum-1, 0, 1, thick));  // Shrink thickness with each step
        gradient = lerpColor(colStart,colEnd,i*part);
        stroke(gradient);  // Change color with each step. Enter this for a crazy effect (colStart-i*colSeg)
        line(0,0,segLen,0);  // Draw Segment
        translate(segLen,0);  // Apply new starting for the next drawing step ("Growing of the Spline")
        float factor = sin(map(i, 0, segNum-1, PI*0.55, PI*(2.55*freq)));  // Calculate next rotation
        rotate(radians(ampl*factor));  // Apply rotation for next drawing step
      }
    popMatrix();
    segTeller += 1;  // Preparating next iteration (Make next Loop longer/Grow Spline)
      if (segTeller > segNum){  // Stop growth of Spline
        segTeller = segNum;
      }
  }
}
