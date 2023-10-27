PFont font;
int backgroundColor;
boolean channel1instr = false;
boolean channel3instr = false;
float square1X, square2X;
float squareSpeed = 2.0;

void setup() {
  size(800, 600);
  background(155, 93, 229); // Achtergrondkleur #9B5DE5
  
  font = createFont("Arial", 96);
  textFont(font);
  
  square1X = width / 4;
  square2X = width / 4 * 3;
}

void draw() {
  // Achtergrondkleur fade tussen #9B5DE5 en #FFFFFF
  background(lerpColor(color(155, 93, 229), color(255), map(mouseX, 0, width, 0, 1)));
  
  // Tekst "WARNING" in het wit weergeven als channel3instr is gedetecteerd
  if (channel3instr) {
    fill(255);
    textSize(96);
    textAlign(CENTER, CENTER);
    text("WARNING", width / 2, height / 2);
  }
  
  // Vierkanten tekenen en bewegen, tenzij channel1instr is gedetecteerd
  if (!channel1instr) {
    fill(143, 247, 92); // Kleur #8FF75C
    rect(square1X, height / 3, 100, 100);
    rect(square2X, height / 1.5, 100, 100);
    
    square1X += squareSpeed;
    square2X -= squareSpeed;
    
    if (square1X > width || square1X < 0) {
      squareSpeed *= -1;
    }
  }
}

void keyPressed() {
  if (key == '1') {
    channel1instr = !channel1instr;
  }
  
  if (key == '3') {
    channel3instr = !channel3instr;
  }
}
