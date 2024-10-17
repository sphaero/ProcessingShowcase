void createBuidlings()
{

  if (channel2instr == 1)
  {
    buildingType1height = -50;
  } else
  {
    buildingType1height = 0;
  }

  if (channel2instr == 2)
  {
    buildingType2height = -100;
  } else
  {
    buildingType2height = -50;
  }

  if (channel2instr == 3)
  {
    buildingType3height = -150;
  } else
  {
    buildingType3height = -100;
  }

  //building shapes

  //Small building
  PShape building1 = createShape(GROUP);
  PShape building1Form = createShape();
  building1Form.beginShape();
  building1Form.fill(200, 150, 255);
  building1Form.vertex(-50, 200);
  building1Form.vertex(50, 200);
  building1Form.vertex(50, buildingType1height);
  building1Form.vertex(-50, buildingType1height);

  PShape building1Window1 = createShape();
  building1Window1.beginShape();
  building1Window1.fill(int(random(230, 255)), 200, 150);
  building1Window1.vertex(-40, 170);
  building1Window1.vertex(10, 170);
  building1Window1.vertex(10, 150);
  building1Window1.vertex(-40, 150);

  PShape building1Window2 = createShape();
  building1Window2.beginShape();
  building1Window2.fill(int(random(230, 255)), 200, 150);
  building1Window2.vertex(-10, 110);
  building1Window2.vertex(40, 110);
  building1Window2.vertex(40, 90);
  building1Window2.vertex(-10, 90);

  PShape building1Window3 = createShape();
  building1Window3.beginShape();
  building1Window3.fill(int(random(230, 255)), 200, 150);
  building1Window3.vertex(-40, 40);
  building1Window3.vertex(10, 40);
  building1Window3.vertex(10, 60);
  building1Window3.vertex(-40, 60);

  building1.addChild(building1Form);
  building1.addChild(building1Window1);
  building1.addChild(building1Window2);
  building1.addChild(building1Window3);

  //medium building

  PShape building2 = createShape(GROUP);
  PShape building2Form = createShape();
  building2Form.beginShape();
  building2Form.fill(150, 200, 255);
  building2Form.vertex(-50, 200);
  building2Form.vertex(50, 200);
  building2Form.vertex(50, buildingType2height);
  building2Form.vertex(-50, buildingType2height);

  PShape building2Window1 = createShape();
  building2Window1.beginShape();
  building2Window1.fill(int(random(230, 255)), 200, 150);
  building2Window1.vertex(-20, 160);
  building2Window1.vertex(20, 160);
  building2Window1.vertex(20, 180);
  building2Window1.vertex(-20, 180);

  PShape building2Window2 = createShape();
  building2Window2.beginShape();
  building2Window2.fill(int(random(230, 255)), 200, 150);
  building2Window2.vertex(-10, 100);
  building2Window2.vertex(30, 100);
  building2Window2.vertex(30, 120);
  building2Window2.vertex(-10, 120);

  PShape building2Window3 = createShape();
  building2Window3.beginShape();
  building2Window3.fill(int(random(230, 255)), 200, 150);
  building2Window3.vertex(-40, 50);
  building2Window3.vertex(20, 50);
  building2Window3.vertex(20, 70);
  building2Window3.vertex(-40, 70);

  PShape building2Window4 = createShape();
  building2Window4.beginShape();
  building2Window4.fill(int(random(230, 255)), 200, 150);
  building2Window4.vertex(-10, -10);
  building2Window4.vertex(30, -10);
  building2Window4.vertex(30, 10);
  building2Window4.vertex(-10, 10);

  building2.addChild(building2Form);
  building2.addChild(building2Window1);
  building2.addChild(building2Window2);
  building2.addChild(building2Window3);
  building2.addChild(building2Window4);

  //tall building

  PShape building3 = createShape(GROUP);
  PShape building3Form = createShape();
  building3Form.beginShape();
  building3Form.fill(150, 150, 255);
  building3Form.vertex(-50, 200);
  building3Form.vertex(50, 200);
  building3Form.vertex(50, buildingType3height);
  building3Form.vertex(-50, buildingType3height);

  PShape building3Window1 = createShape();
  building3Window1.beginShape();
  building3Window1.fill(int(random(230, 255)), 200, 150);
  building3Window1.vertex(0, 150);
  building3Window1.vertex(40, 150);
  building3Window1.vertex(40, 170);
  building3Window1.vertex(0, 170);

  PShape building3Window2 = createShape();
  building3Window2.beginShape();
  building3Window2.fill(int(random(230, 255)), 200, 150);
  building3Window2.vertex(-30, 110);
  building3Window2.vertex(20, 110);
  building3Window2.vertex(20, 130);
  building3Window2.vertex(-30, 130);

  PShape building3Window3 = createShape();
  building3Window3.beginShape();
  building3Window3.fill(int(random(230, 255)), 200, 150);
  building3Window3.vertex(-40, 90);
  building3Window3.vertex(0, 90);
  building3Window3.vertex(0, 70);
  building3Window3.vertex(-40, 70);

  PShape building3Window4 = createShape();
  building3Window4.beginShape();
  building3Window4.fill(int(random(230, 255)), 200, 150);
  building3Window4.vertex(40, 0);
  building3Window4.vertex(0, 0);
  building3Window4.vertex(0, -20);
  building3Window4.vertex(40, -20);

  PShape building3Window5 = createShape();
  building3Window5.beginShape();
  building3Window5.fill(int(random(230, 255)), 200, 150);
  building3Window5.vertex(10, -30);
  building3Window5.vertex(-40, -30);
  building3Window5.vertex(-40, -50);
  building3Window5.vertex(10, -50);

  building3.addChild(building3Form);
  building3.addChild(building3Window1);
  building3.addChild(building3Window2);
  building3.addChild(building3Window3);
  building3.addChild(building3Window4);
  building3.addChild(building3Window5);



//start building generation

//building1
building1Pos = building1Pos - 1;
if (building1Pos < -50)
{
  building1Pos = 850;
  building1Type = int(random(0,4));
}
if (building1Type == 1)
{
  shape(building1, building1Pos, 170);
}
else if (building1Type == 2)
{
  shape(building2, building1Pos, 170);
}
else 
{
  shape(building3, building1Pos, 170);
}

//building 2

building2Pos = building2Pos - 1;
if (building2Pos < -50)
{
  building2Pos = 850;
  building2Type = int(random(0,4));
}
if (building2Type == 1)
{
  shape(building1, building2Pos, 170);
}
else if (building2Type == 2)
{
  shape(building2, building2Pos, 170);
}
else 
{
  shape(building3, building2Pos, 170);
}

//building 3

building3Pos = building3Pos - 1;
if (building3Pos < -50)
{
  building3Pos = 850;
  building3Type = int(random(0,4));
}
if (building3Type == 1)
{
  shape(building1, building3Pos, 170);
}
else if (building3Type == 2)
{
  shape(building2, building3Pos, 170);
}
else 
{
  shape(building3, building3Pos, 170);
}

//building 4

building4Pos = building4Pos - 1;
if (building4Pos < -50)
{
  building4Pos = 850;
  building4Type = int(random(0,4));
}
if (building4Type == 1)
{
  shape(building1, building4Pos, 170);
}
else if (building4Type == 2)
{
  shape(building2, building4Pos, 170);
}
else 
{
  shape(building3, building4Pos, 170);
}

//building 5

building5Pos = building5Pos - 1;
if (building5Pos < -50)
{
  building5Pos = 850;
  building5Type = int(random(0,4));
}
if (building5Type == 1)
{
  shape(building1, building5Pos, 170);
}
else if (building5Type == 2)
{
  shape(building2, building5Pos, 170);
}
else 
{
  shape(building3, building5Pos, 170);
}



}
