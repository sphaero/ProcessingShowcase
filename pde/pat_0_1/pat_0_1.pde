//made by Anna-Lina Helsen based on Stan's Pattern 1

//PLEASE DON'T PAINT OVER THE PATTERN WITH BACKGROUND!
// ADD PUSH AND POP! 

float angleLines = 0;
float bezier = 2;
float speedLines = 0.03; //OG 0.07

void setup() {
  size(720, 480);
  background(0);
  stroke(255);
}

//define the colours 
color color1 = color(255, 113, 52); //colour 1 from spreadsheet ORANGE
color color2 = color(235, 215, 168); //colour 2 from spreadsheet BEIGE
color color3 = color(128, 128, 0); //colour 3 from spreadsheet GREEN
color color4 = color(255, 219, 88); //colour 4 from spreadsheet YELLOW


void draw() {
  //background(128, 128, 20);
  translate(width/2, height/2); //OG 2 and 2
  rotate(angleLines);
  //bezier(15,10,150,60,80,90,110,230);
  
  // Draw moving lines with randomized colors
  for (float y = -height/2; y < height/200; y += 5) {
    float x1 = sin(angleLines) * y;
    float x2 = sin(bezier) * y;
    
/*
  for (float y = -height/2; y < height/2; y += 330) {
    float x1 = sin(angleLines) * y;
    float x2 = cos(angleLines) * y;
    */ 
    
    // Generate a random index to choose a color
    int colorIndex = int(random(4));
    
    // Assign colors based on the random index
    if (colorIndex == 0) {
      stroke(128, 128, 0); // Yellowish color
    } else if (colorIndex == 1) {
      stroke(255, 113, 52); // Orange color
    } else {
      stroke(255, 219, 88); // Light yellow color
    }
    
     // Generate a random thickness value between 1 and 5
    float thickness = random(1, 10);
    strokeWeight(thickness);
    
    line(x1, y, x2, y);
  }
  
  // Draw second set of rotating lines with randomized colors
  rotate(HALF_PI);
  for (float y = -height/2; y < height/2; y += 30) {
    float x1 = sin(angleLines) * y;
    float x2 = cos(angleLines) * y;
    

    // Generate a random index to choose a color
    int colorIndex = int(random(4));
    
    // Assign colors based on the random index
    if (colorIndex == 0) {
      stroke(128, 128, 0); // GREEN
    } else if (colorIndex == 1) {
      stroke(255, 113, 52); // ORANGE
    } else if (colorIndex == 2) {
      stroke(235, 215, 168); // BEIGE
    } else {
      stroke(255, 219, 88); // YELLOW
    }
    
      
    line(x1, y, x2, y);
  }
  
  angleLines += speedLines;
}
