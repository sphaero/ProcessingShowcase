//made by Thomas Wind
// Work in Progress, deels hulp ChatGPT voor het roteren van de rectangle

float rectSize = 0;     
boolean isOranje = false; 
float angle = radians(45); 

void setup() {
  size(720, 480);  
}

void draw() {
   noStroke();   
   
  if (isOranje) {
    background(254, 149, 119); 
    fill(1, 106, 136);        
  } else {
    background(1, 106, 136);   
    fill(254, 149, 119);      
  }

  translate(width / 2, height / 2); 
  rotate(angle); 

  rectMode(CENTER);
  rect(0, 0, rectSize, rectSize); 

  rectSize += 50;

  if (rectSize > width * 1.5) { 
    rectSize = 0;          
    isOranje = !isOranje;    
  }
}
