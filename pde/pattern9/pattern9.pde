import netP5.*;
import oscP5.*;

OscP5 oscP5;

//var for star
Star[] stars = new Star[50];

//var for car
int carPosXTracker = 250;
int noteTrackerTrackOne = 0;
float wheelRotation = 0;

//var for buildings
int building1Type = int(random(0,4));
int building1Pos = 50;
int building2Type = int(random(0,4));
int building2Pos = 150;
int building3Type = int(random(0,4));
int building3Pos = 250;
int building4Type = int(random(0,4));
int building4Pos = 350 ;
int building5Type = int(random(0,4));
int building5Pos = 450;

int buildingType1height = 0;
int buildingType2height = -50;
int buildingType3height = -100;

//var for road
int lineTracker = 0;
int linePosTracker = 720;
int lineTracker2 = -30;
int linePosTracker2 = 720;
int lineTracker3 = -30;
int linePosTracker3 = 720;
int lineSpeedMultiplier = 1;

//var for music timing
int songposition = 0;
int patternnr = 0;
int patternrow = 0;
int channel1instr = 0;
int channel2instr = 0;
int channel3instr = 0;
int channel4instr = 0;
int channel1note = 0;
int channel2note = 0;
int channel3note = 0;
int channel4note = 0;
char channel1effect;
char channel2effect;
char channel3effect;
char channel4effect;
String channel1effect_param = "00";
String channel2effect_param = "00";
String channel3effect_param = "00";
String channel4effect_param = "00";
String feedback_formatted = "";

//shapes
PShape car;
PShape wheel;


void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this, 6200);
  
  for(int i = 0; i < stars.length ; i = i + 1)
  {
    stars[i] = new Star();
  }

  car = createShape(GROUP);
  wheel = createShape(GROUP);

//create outer shape of the wheel
  PShape wheelTire = createShape();
  wheelTire.beginShape();
  wheelTire.fill(10, 10, 40);
  wheelTire.noStroke();
  wheelTire.curveVertex(0, -20);
  wheelTire.curveVertex(14, -14);
  wheelTire.curveVertex(20, 0);
  wheelTire.curveVertex(14, 14);
  wheelTire.curveVertex(0, 20);
  wheelTire.curveVertex(-14, 14);
  wheelTire.curveVertex(-20, 0);
  wheelTire.curveVertex(-14, -14);
  wheelTire.curveVertex(0, -20);
  //empty inside of the wheel
  wheelTire.beginContour();
  wheelTire.curveVertex(0, -10);
  wheelTire.curveVertex(-7, -7);
  wheelTire.curveVertex(-10, 0);
  wheelTire.curveVertex(-7, 7);
  wheelTire.curveVertex(0, 10);
  wheelTire.curveVertex(7, 7);
  wheelTire.curveVertex(10, 0);
  wheelTire.curveVertex(7, -7);
  wheelTire.curveVertex(0, -10);
  wheelTire.endContour();

//create inner shape of the wheel
  PShape wheelFrame = createShape();
  wheelFrame.beginShape();
  wheelFrame.fill(20, 20, 60);
  wheelFrame.noStroke();
  wheelFrame.vertex(2, -12);
  wheelFrame.vertex(2, -2);
  wheelFrame.vertex(12, -2);
  wheelFrame.vertex(12, 2);
  wheelFrame.vertex(2, 2);
  wheelFrame.vertex(2, 12);
  wheelFrame.vertex(-2, 12);
  wheelFrame.vertex(-2, 2);
  wheelFrame.vertex(-12, 2);
  wheelFrame.vertex(-12, -2);
  wheelFrame.vertex(-2, -2);
  wheelFrame.vertex(-2, -12);

//create the frame of the car
  PShape carFrame = createShape();
  carFrame.beginShape();
  carFrame.fill(20, 30, 70);
  carFrame.noStroke();
  carFrame.vertex(0, 0);
  carFrame.vertex(20, 0);
  carFrame.vertex(40, -30);
  carFrame.vertex(140, -30);
  carFrame.vertex(200, 0);
  carFrame.vertex(200, 10);
  carFrame.vertex(230, 10);
  carFrame.vertex(230, 40);
  carFrame.vertex(200, 45);
  carFrame.vertex(190, 30);
  carFrame.vertex(180, 25);
  carFrame.vertex(170, 25);
  carFrame.vertex(160, 30);
  carFrame.vertex(150, 45);
  carFrame.vertex(70, 45);
  carFrame.vertex(60, 30);
  carFrame.vertex(50, 25);
  carFrame.vertex(40, 25);
  carFrame.vertex(30, 30);
  carFrame.vertex(20, 45);
  carFrame.vertex(0, 45);
  carFrame.endShape();

//create the headlight of the car
  PShape carLamp = createShape();
  carLamp.beginShape();
  carLamp.fill(200, 200, 50);
  carLamp.vertex(200, 0);
  carLamp.vertex(200, 10);
  carLamp.vertex(230, 10);
  endShape(CLOSE);

//grouping the shapes
  car.addChild(carLamp);
  car.addChild(carFrame);
  
  wheel.addChild(wheelTire);
  wheel.addChild(wheelFrame);
}

void draw()
{
  //making the car move properly between left and right when the music note 23 changes pitch
  if (channel1note !=  noteTrackerTrackOne && channel1instr == 23)
  {
    noteTrackerTrackOne = channel1note;
    if ( carPosXTracker > 400)
    {
      carPosXTracker = carPosXTracker + int(random(-40, 10));
    } else if ( carPosXTracker < 50)
    {
      carPosXTracker = carPosXTracker + int(random(-10, 40));
    } else
    {
      carPosXTracker = carPosXTracker + int(random(-30, 30));
    }
  }
  
  
  background(10, 10, 50);
  
   for(int i = 0; i < stars.length; i = i + 1)
  {
    stars[i].move();
    stars[i].appear();
  }
  drawRoad();
  createBuidlings();
  drawCar(carPosXTracker, 0, 0);
}
