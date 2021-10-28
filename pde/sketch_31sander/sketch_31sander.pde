float circleX;
float circleY; 
float teller = 1;
float delta = 1;
PFont f;
float angleRotate = 0.0;

void setup()
{
  size (720, 480);
  background(#FFE30A);
  //PFont f;
  //PFont l;
  //PFont m;
}

void draw() {

  circleX = random(width);
  circleY = random(height);
  float bms = 60000/140;
  float fms = 1000/60;
  float framesInBeat = bms/fms;
  println(int(framesInBeat));
  if ( frameCount % int(framesInBeat) < 5)
  {
    background (#ffffff);
    textSize(150);
text("TO THE", 80, 180); 
fill(#FA0505);
text("GATES", 120, 300);
fill(#FA0505);
text("OF HELL", 80, 420);


  } else
  {
    background(#000000);
    noStroke();
    fill(#FA0505);

    rect(225, 225, 275, 100);
    rect(225, 175, 250, 100);
    rect(250, 125, 200, 100);
    rect(225, 250, 250, 100);
    rect(250, 300, 200, 100);
    rect(275, 325, 150, 100);

    stroke(0, 0, 0);
    strokeWeight(5);

    //Horns linkerkant
    fill(#FA0505);
    rect(200, 50, 25, 25);
    fill(#FA0505);
    rect(200, 75, 25, 25);
    rect(225, 75, 25, 25);
    rect(225, 100, 25, 25);
    rect(225, 125, 50, 25);
    fill(#FA0505);

    rect(250, 125, 50, 25);
    rect(175, 50, 25, 25);
    rect(175, 75, 25, 25);
    rect(200, 75, 25, 25);
    fill(#FA0505);

    rect(200, 100, 25, 25);
    rect(200, 125, 50, 25);
    rect(225, 125, 50, 25);
    rect(150, 50, 25, 25);
    rect(150, 25, 25, 25);



    //voorhoofd
    rect(300, 100, 120, 25);

    //Horns rechterkant
    rect(420, 125, 50, 25);
    rect(470, 125, 25, 25);
    rect(470, 100, 25, 25);
    rect(470, 75, 25, 25);
    fill(#FA0505);

    rect(495, 75, 25, 25);
    rect(495, 50, 25, 25);
    rect(445, 125, 50, 25);
    rect(495, 125, 25, 25);
    fill(#FA0505);

    rect(495, 100, 25, 25);
    rect(495, 75, 25, 25);
    rect(520, 75, 25, 25);
    rect(520, 50, 25, 25);
    rect(545, 50, 25, 25);
    rect(545, 25, 25, 25);



    //zijkant links
    rect(250, 150, 25, 25);
    rect(225, 175, 25, 50);
    rect(225, 175, 25, 50);
    rect(200, 225, 25, 100);
    rect(225, 325, 25, 25);
    rect(250, 350, 25, 25);
    rect(250, 375, 25, 25);
    rect(275, 400, 25, 25);
    rect(300, 425, 120, 25);

    //zijkant rechts
    rect(445, 150, 25, 25);
    rect(470, 175, 25, 50);
    rect(495, 225, 25, 100);
    rect(470, 325, 25, 25);
    rect(445, 350, 25, 25);
    rect(445, 375, 25, 25);
    rect(420, 400, 25, 25);

    //ogen
    fill(#000000);
    rect(275, 235, 50, 50);
    fill(#ffffff);
    rect(275, 235, 25, 25);
    fill(#000000);
    rect(390, 235, 50, 50);
    fill(#ffffff);
    rect(390, 235, 25, 25);

    //moffo
    
  }

  ellipse(circleX, circleY, 15, 720);
  fill(#FA0505);

  ellipse(circleX, circleY, 720, 15);
  fill(#FA0505);







  circleX = circleX +random(-2.2);
}
