void setup() {
  size(720, 480);
  background(0);
}

int teller = 0;
int delta = 1;

void draw()
{
  background(0);

  noStroke();
  //stroboscope
  if (teller == 50)
  {
    background(255);
    teller = 0;
  }
  teller = teller + 1;

  float snelheid = 0.14;
  float draaiCir = 3;

  // kleur vervangen  
  teller = teller + delta;
  if (teller > height - 50)
  {
    delta = delta - 1;
  }
  if (teller < 0)
  {
    delta = 1;
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 0, 0);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)-310, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)-310, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 0, 0);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir), cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir), sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 0, 0);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+310, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+310, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 0, 0);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+620, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+620, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)-155, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 0, 255);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)-155, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+155, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 0, 255);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+155, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  if (frameCount % 200 > 104)
  {
    fill(255, 255, 0);
    rect(cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+465, sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  } else
  {
    fill(0, 0, 255);
    rect(sin(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+465, cos(frameCount*snelheid)*(height/draaiCir)+(height/draaiCir)+30, 100, 100 );
  }

  println(teller);
}
