//Spekkerts Melting
//o no my dear spekkies melting in the heat of the techno ravvvE!
// delta * -1 

String message =  "o no my dear spekkies melting in the heat of the techno ravvvE!";
float x, y; // X n Y coordinaten tekst
float hr, vr;  // horizontale n vertic radius

Spekkie mySpekkie;
void setup() {
  size(720, 480);
  background(255);
  mySpekkie = new Spekkie();
}

int delta = 1;
int strobeSpeed = 10;

void draw() {

  
{
  int m = millis();
  noStroke();
  fill(m % 255);
  rect(25, 25, 50, 50);
}

  background(113);
  mySpekkie.display();
  mySpekkie.drive();


  background(255);
  mySpekkie.display();
  mySpekkie.drive();

  if (frameCount%strobeSpeed==0)background(0);



  String s = "o no my dear spekkies melting in the heat of the techno ravvvE!";
  fill(255,0,127);
  text(s, 450, 100, 192, 324);  // text die in tekstvak zit, definieren van tekstvak
  
  {
    
      
  // Lettertype
  textFont(createFont("georgia", 15));
  textAlign(CENTER, CENTER);
  
  }
  
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
    fill(243, 167, 18);
    quad(xPos, yPos, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad (xPos+1, yPos+1, 126, 60, 109, 103, 70, 116);

    //spekkie II
    pushMatrix();
    translate(208, 10);
    fill(243, 167, 18);
    quad(xPos, yPos, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(xPos+1, yPos+1, 126, 60, 109, 103, 70, 116);
    popMatrix();



    //spekkie III
    pushMatrix();
    translate(-5, -5);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();


    //sateprikker I

    fill (61, 220, 151);
    rect(300, 72, 5, 900);

    //sateprikker II
    fill (61, 220, 151);
    rect(91, 102, 5, 900);


    //spekkie 4
    pushMatrix();
    translate(-5, 160);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();

    //spekkie 5
    pushMatrix();
    translate(-5, 300);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();


    //spekkie 6
    pushMatrix();
    translate(205, 2);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();
   
     //spekkie 7
    pushMatrix();
    translate(205, 160);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();
    
       //spekkie 8
    pushMatrix();
    translate(205, 310);
    fill(243, 167, 18);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255,0,127);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();
  }
  void drive() {
 
    xPos = xPos + delta; //spekkert naar rechts laten bewegen. delta gebruik ik hier als variabele om de xPos aan te passen
    if (xPos>=20) { 
      delta = -1;
    }

    if (xPos < 0)
    {
      delta =1;
    }
    if (xPos<=-10) { 
      delta = +1;
    }
  }
}
