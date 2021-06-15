//o no my dearie Spekkies melting in the heat of the techno ravvvE!

Spekkie mySpekkie;
void setup() {
  size(720,480);
  background(255);
  mySpekkie = new Spekkie();
 
}

int strobeSpeed = 10;

void draw() {
  
 background(255);
  mySpekkie.display();
  mySpekkie.drive();
  
background(255);
  mySpekkie.display();
  mySpekkie.drive();
 
if(frameCount%strobeSpeed==0)background(0);
  
  
}
class Spekkie {
  int xPos;
  int yPos;
 
  Spekkie() {
    xPos=0;
    yPos=height/2;
  }
 
 
    
    
   //spekkie I
       void display() {
  fill(255,255,0);
quad(xPos, yPos, 126, 60, 109, 103, 70, 116);
  fill(255,182,193);
quad (xPos+1, yPos+1, 126, 60, 109, 103, 70, 116);

    
//spekkie II
pushMatrix();
translate(-5,-5);
  fill(255,255,0);
quad(78, 71, 126, 60, 109, 103, 70, 116);
  fill(255,182,193);
quad(88, 71, 126, 60, 109, 103, 70, 116);
popMatrix();


   //sateprikker

fill (255,222,173);
rect(300, 72, 5, 900);

 //spekkie III
pushMatrix();
translate(205,2);
  fill(255,255,0);
quad(78, 71, 126, 60, 109, 103, 70, 116);
  fill(255,182,193);
quad(88, 71, 126, 60, 109, 103, 70, 116);
popMatrix(); 
    
    
  }
  void drive() {
    xPos++; // spekkert naar rechts laten bewegen
    if(xPos>width) { 
      xPos= width;
    }
  }
}
