int r =0;
int count = 0;

void setup ()
{
  size(720,480);
  

  
}

void strobe(int freq)  // strobe functie die een getal als parameter krijgt 
{
  if (count == freq)   // als count gelijk is aan de meegegeven parametere (freq) 
  {
    background(250,0,0);   // dan achtergrond wit
    count = 0;         // zet count weer terug op 0
  }
  else
  {
    background(0,0,255);     // anders is de achtergrond zwart
  }
  count = count + 1;   // tel weer 1 verder

}

void draw()
{  
  
  strobe(6);
  
  textSize(200);


pushMatrix();

  translate(200,-450);
  rotate(radians(r*5));
  //rectMode(CENTER);
  noFill();
  stroke(255,200,20);
  strokeWeight(5);
  ellipse(50,0,25,25);
  ellipse(50,0,50,50);
  ellipse(50,0,100,100);
  ellipse(50,0,150,150);
  ellipse(50,0,200,200);
  ellipse(50,0,250,250);
  ellipse(50,0,300,300);
  ellipse(50,0,350,350);
  ellipse(50,0,400,400);
  ellipse(50,0,450,450);
  ellipse(50,0,500,500);
  ellipse(50,0,550,550);
  ellipse(50,0,600,600);
  ellipse(50,0,650,650);
  ellipse(50,0,700,700);
  ellipse(50,0,750,750);
  ellipse(50,0,800,800);
  ellipse(50,0,850,850);
  ellipse(50,0,900,900);
  ellipse(50,0,950,950);
  ellipse(50,0,1000,1000);
  ellipse(50,0,1050,1050);
  ellipse(50,0,1100,1100);
  ellipse(50,0,1150,1150);
  ellipse(50,0,1200,1200);
  ellipse(50,0,1250,1250);
  ellipse(50,0,1300,1300);
  ellipse(50,0,1350,1350);
  ellipse(50,0,1400,1400);
  ellipse(50,0,1450,1450);
  ellipse(50,0,1500,1500);
  ellipse(50,0,1550,1550);
  ellipse(50,0,1600,1600);
  ellipse(50,0,1650,1650);
  ellipse(50,0,1700,1700);
  ellipse(50,0,1750,1750);
  ellipse(50,0,1800,1800);
  ellipse(50,0,1850,1850);
  ellipse(50,0,1900,1900);
  ellipse(50,0,1950,1950);
  ellipse(50,0,2000,2000);
  ellipse(50,0,2050,2050);
  ellipse(50,0,2100,2100);
  ellipse(50,0,2150,2150);
  
  r+= 1;
 println(r+1);
  popMatrix();
 
 pushMatrix();
 
 translate(400,-450);
  rotate(radians(r*-4));
  //rectMode(CENTER);
  noFill();
  stroke(255,200,20);
  strokeWeight(5);
  ellipse(50,0,25,25);
  ellipse(50,0,50,50);
  ellipse(50,0,100,100);
  ellipse(50,0,150,150);
  ellipse(50,0,200,200);
  ellipse(50,0,250,250);
  ellipse(50,0,300,300);
  ellipse(50,0,350,350);
  ellipse(50,0,400,400);
  ellipse(50,0,450,450);
  ellipse(50,0,500,500);
  ellipse(50,0,550,550);
  ellipse(50,0,600,600);
  ellipse(50,0,650,650);
  ellipse(50,0,700,700);
  ellipse(50,0,750,750);
  ellipse(50,0,800,800);
  ellipse(50,0,850,850);
  ellipse(50,0,900,900);
  ellipse(50,0,950,950);
  ellipse(50,0,1000,1000);
  ellipse(50,0,1050,1050);
  ellipse(50,0,1100,1100);
  ellipse(50,0,1150,1150);
  ellipse(50,0,1200,1200);
  ellipse(50,0,1250,1250);
  ellipse(50,0,1300,1300);
  ellipse(50,0,1350,1350);
  ellipse(50,0,1400,1400);
  ellipse(50,0,1450,1450);
  ellipse(50,0,1500,1500);
  ellipse(50,0,1550,1550);
  ellipse(50,0,1600,1600);
  ellipse(50,0,1650,1650);
  ellipse(50,0,1700,1700);
  ellipse(50,0,1750,1750);
  ellipse(50,0,1800,1800);
  ellipse(50,0,1850,1850);
  ellipse(50,0,1900,1900);
  ellipse(50,0,1950,1950);
  ellipse(50,0,2000,2000);
  ellipse(50,0,2050,2050);
  ellipse(50,0,2100,2100);
  ellipse(50,0,2150,2150);
  
  
  popMatrix();
 
}
