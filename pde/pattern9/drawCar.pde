void drawCar(int carPosX, int carPosY, int carWheelSpeed)
{
  shape(car, carPosX, 360);

  pushMatrix();
  translate(carPosX+45, 400);
  rotate(wheelRotation);
  shape(wheel, 0, 0);
  wheelRotation = wheelRotation + 0.2;
  popMatrix();

  pushMatrix();
  translate(carPosX+175, 400);
  rotate(wheelRotation);
  shape(wheel, 0, 0);
  popMatrix();

  if (wheelRotation > 100)
  {
    wheelRotation = 0;
  }
}
