float angle = 0;
float angleSpeed = 0.05;

void setup() {
  size(720, 480);
}

void draw() {
  background(220);
  
  // Draw skull with curly hair
  int count=0;
  while (count<20)
  {
    Henk(count*35, sin((frameCount+count)*0.125)*100+height/2);
    count=count +1;
  }
  // Update angle for animationx
  angle += angleSpeed;
}

void drawTwirlyWhirlwinds() {
  // Set color and stroke properties for the whirlwinds
  stroke(259, 0, 0); // Red color
  strokeWeight(1);
  noFill();
  
  // Calculate center position of the whirlwinds
  float centerX = width/2;
  float centerY = height/2;
  
  // Set the radius and offset for the whirlwinds
  float radius = 100;
  float offset = 50;
  
}

void drawWhirlwind(float x, float y, float radius, float rotation) {
  pushMatrix();
  translate(x, y);
  rotate(rotation);
  
  // Draw the whirlwind as a spiral shape
  float startAngle = 0;
  float endAngle = PI * 2;
  float angleStep = 0.1;
  float spiralAngle = startAngle;
  
  while (spiralAngle < endAngle) {
    float posX = radius * cos(spiralAngle);
    float posY = radius * sin(spiralAngle);
    point(posX, posY);
    
    spiralAngle += angleStep;
    radius += 1.8;
  }
  
  popMatrix();
}

void Henk(float x, float y){
  
    // Move Henk 30 units to the left
  x -= 68;
  
  // Head
  fill(214, 125, 25);
  ellipse(x, y, 200, 200);
  
  // Eyes
  fill(0);
  ellipse(x - 40, y - 40, 40, 40);
  ellipse(x + 40, y - 40, 40, 40);
  
// Eye Sockets
int greenColor = color(77, 176, 75); // Green color
int yellowColor = color(248, 196, 52); // Yellow color

// Define the speed of color change
float colorChangeSpeed = 4.9; // Adjust this value to change the speed

// Calculate the intermediate color based on a fade percentage
float fadePercentage = (millis() * colorChangeSpeed) % 1.0;

int redComponent = (int)lerp(red(greenColor), red(yellowColor), fadePercentage);
int greenComponent = (int)lerp(green(greenColor), green(yellowColor), fadePercentage);
int blueComponent = (int)lerp(blue(greenColor), blue(yellowColor), fadePercentage);

int intermediateColor = color(redComponent, greenComponent, blueComponent);

fill(intermediateColor);
ellipse(x - 40, y - 40, 20, 20);
ellipse(x + 40, y - 40, 20, 20);

  // Nose
  fill(0);
  triangle(x - 20, y, x + 20, y, x, y + 30);
  
  // Teeth
  fill(255);
  rectMode(CENTER);
  rect(x - 40, y + 60, 30, 30);
  rect(x - 10, y + 60, 30, 30);
  rect(x + 20, y + 60, 30, 30);
  rect(x + 50, y + 60, 30, 30);
  
  // Jawline
  stroke(0);
  strokeWeight(15);
  line(x - 70, y + 90, x + 70, y + 90);

  // Set curly hair color
  stroke(0);
  strokeWeight(2);
  noFill();
  
  // Define the parameters for the curly hair
  float curlRadius = 50;
  float curlDistance = 30;
  float curlAngleOffset = 0.2;
  float curlRotationSpeed = 0.1;
  
  // Calculate the number of curls based on the head size
  int numCurls = int(random(10, 20));
  
  // Draw the curly hair
  for (int i = 0; i < numCurls; i++) {
    float angle = i * curlAngleOffset;
    float curlX = x + curlDistance * cos(angle + curlRotationSpeed * frameCount);
    float curlY = y + curlDistance * sin(angle + curlRotationSpeed * frameCount);
    ellipse(curlX, curlY, curlRadius, curlRadius);
  }
}
