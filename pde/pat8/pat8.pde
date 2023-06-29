float[] rotationSpeeds; //array (container) to store rotation speeds for each cat

void setup() {
  size(720, 480);

  int columns = width / 100; //number of columns in the grid (how many cats fit horizontally)
  int rows = height / 100; //number of rows in the grid (how many cats fit vertically)
  int arrayLength = columns * rows;  //how many cats are there in total?

  rotationSpeeds = new float[arrayLength]; // we are creating/preparing the container with enough space for all the rotation speeds

  //for: This is the keyword that indicates the start of a loop.
  //int i = 0: We're declaring a new variable called i and setting its initial value to 0. This variable i will serve as the index of the current element we're working with in the rotationSpeeds array.
  //i < arrayLength: This is the condition that determines whether the loop should continue or stop. As long as i is less than the arrayLength (= the total amount of cats), the loop will continue.
  //i++: This is the increment statement. After each iteration of the loop, the value of i will increase by 1.

  for (int i = 0; i < arrayLength; i++) { // We are giving each cat (in the rotationSpeeds array) a random rotation speed between 0.001 and 0.01
    rotationSpeeds[i] = random(0.001, 0.05); //we are randomly choosing a rotation speed for each cat, between a very slow and a somewhat fast speed.this value is stored in the rotationSpeeds array at the index i, which corresponds to the current cat.
  }
}

void draw() {
  int countX = 0; //a counter for the horizontal position of the cats
  int countY = 0; //a counter for the vertical position of the cats
  int index = 0; //a counter to access the rotation speed of each cat

  while (countX < width) { //we are going to repeat some actions for each column of cats
    while (countY < height) { //we are going to repeat some actions for each column of cats
      push(); //we are moving the drawing origin to the current position of the cat
      translate(countX, countY); //move the origin of the coordinate system to the current position
      rotate(frameCount * rotationSpeeds[index]); //rotate the cat based on the frame count and rotation speed

      Kat(countX, countY); //draw the cat at the current position

      pop(); //restore the previous position and rotation of the drawing

      countY += 100; //move to the next row of cats
      index++; //move to the next rotation speed for the next cat

      if (index >= rotationSpeeds.length) { //if we reached the end of the rotation speeds, we stop drawing more cats
        break;
      }
    }

    countX += 100; //move to the next row of cats
    countY = 0; //we are resetting the vertical position to the top

    if (index >= rotationSpeeds.length) { //if we reached the end of the rotation speeds, we stop drawing more cats
      break;
    }
  }
}

//this function is responsible for drawing the cat at a given position
void Kat(int xPos, int yPos) {
  pushMatrix();
  translate(xPos, yPos);

  noStroke();
  fill(235, 215, 168);
  rect(15, 25, 75, 70, 20);
  triangle(15, 15, 15, 50, 50, 50);
  triangle(90, 15, 90, 50, 20, 50);
  fill(128, 128, 0);
  circle(35, 45, 15);
  circle(70, 45, 15);
  triangle(44, 60, 60, 60, 51, 68);
  stroke(128, 128, 0);
  strokeWeight(2);
  noFill();
  beginShape();
  vertex(50, 66);
  bezierVertex(56, 62, 42, 81, 34, 69);
  endShape();
  stroke(128, 128, 0);
  strokeWeight(2);
  noFill();
  beginShape();
  vertex(50, 66);
  bezierVertex(65, 85, 74, 61, 70, 69);
  endShape();

  popMatrix();
}
