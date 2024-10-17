int moveX = 10;

int moveY = 10;

int posX = width/2;

int posY = height/2;

String land = "Nederland";



void setup() {

  size(720, 480);

  frameRate(60);
}

void draw() {

  background(255);

  if (posX > width || posX < -120 || posY > height + 80 || posY < -80)
  {
    if (land == "Duitsland") {
      land = "Nederland";
    } else {
      land = "Duitsland";
    }
  }

    //beweging
    posX += moveX;

    posY += moveY;


    if (posX > width || posX < -120)

    {

      moveX *= -1;
    }

    if (posY > height + 80 || posY < -80)

    {

      moveY *= -1;
    }
    if (land == "Nederland")
    {
      Nederland(posX, posY);
    }
    if (land == "Duitsland")
    {
      Duitsland(posX, posY);
    }
  }
