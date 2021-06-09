//Spekkerts Melting
//o no my dear spekkies melting in the heat of the techno ravvvE!
// delta * -1 
Spekkie mySpekkie;
void setup() {
  size(720, 480);
  background(255);
  mySpekkie = new Spekkie();
}

int delta = 1;
int strobeSpeed = 10;

void draw() {



  background(255);
  mySpekkie.display();
  mySpekkie.drive();


  background(255);
  mySpekkie.display();
  mySpekkie.drive();

  if (frameCount%strobeSpeed==0)background(0);



  String s = "o no my dear spekkies melting in the heat of the techno ravvvE!";
  fill(50);
  text(s, 400, 400, 200, 200);  // text die in tekstvak zit, definieren van tekstvak
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
    fill(255, 255, 0);
    quad(xPos, yPos, 126, 60, 109, 103, 70, 116);
    fill(255, 182, 193);
    quad (xPos+1, yPos+1, 126, 60, 109, 103, 70, 116);

    //spekkie II
    pushMatrix();
    translate(208, 10);
    fill(255, 255, 0);
    quad(xPos, yPos, 126, 60, 109, 103, 70, 116);
    fill(255, 182, 193);
    quad(xPos+1, yPos+1, 126, 60, 109, 103, 70, 116);
    popMatrix();



    //spekkie III
    pushMatrix();
    translate(-5, -5);
    fill(255, 255, 0);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255, 182, 193);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();


    //sateprikker I

    fill (255, 222, 173);
    rect(300, 72, 5, 900);

    //sateprikker II
    fill (255, 222, 173);
    rect(91, 102, 5, 900);

    //spekkie 4
    pushMatrix();
    translate(205, 2);
    fill(255, 255, 0);
    quad(78, 71, 126, 60, 109, 103, 70, 116);
    fill(255, 182, 193);
    quad(88, 71, 126, 60, 109, 103, 70, 116);
    popMatrix();
  }
  void drive() {
 
    xPos = xPos + delta; //spekkert naar rechts laten bewegen. delta gebruik ik hier als variabele om de xPos aan te passen
    if (xPos>=width) { 
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
