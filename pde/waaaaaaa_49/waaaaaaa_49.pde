float x = 50;
float y = 50;
float xSpeed = 5;  
float ySpeed = 5; 
int rectWidth = 100; 
int rectHeight = 50;  

void setup() {
  size(800, 600);
}

void draw() {
  background(0); 

  x += xSpeed;
  y += ySpeed;


  if (x < 0 || x + rectWidth > width) {
    xSpeed = -xSpeed;  
  }
  if (y < 0 || y + rectHeight > height) {
    ySpeed = -ySpeed; 
  }


  fill(0, 255, 0); 
  rect(x, y, rectWidth, rectHeight);
}
