
int count = 0;    // globale variabele voor de strobe functie
int ypos = 0;     // globale variabele voor de y positie van de cirkel (ellips)
int ydelta = 20;  // globale variabele voor de snelheid van de cirkel 
int xpos = 0;
int r =0;


void setup() 
{
//  loadSounds(22,30);
  size(720,480);
  

}

void strobe(int freq)  // strobe functie die een getal als parameter krijgt 
{
  if (count == freq)   // als count gelijk is aan de meegegeven parametere (freq) 
  {
    background(10,200,0);   // dan achtergrond wit
    count = 0;         // zet count weer terug op 0
  }
  else
  {
    background(200,0,30);     // anders is de achtergrond zwart
  }
  count = count + 1;   // tel weer 1 verder

}

void draw() 
{

  
  strobe(5);

  ypos = ypos + ydelta;
  if (ypos >= height-30 )
  {
    ydelta = ydelta * -1;
  }
  if (ypos <= -200)
  {
    ydelta = ydelta * -1;
  }
  
  


  //translate(500,500);
  rotate(radians(r*5));
  //ellipseMode(CENTER);
  noFill();
  stroke(10,20,20);
  strokeWeight(3);

  ellipse(width/2,height/2,500,450);
  ellipse(width/2,height/2,500,400);
  ellipse(width/2,height/2,500,350);
  ellipse(width/2,height/2,500,300);
  ellipse(width/2,height/2,500,250);
  ellipse(width/2,height/2,500,200);
  ellipse(width/2,height/2,500,150);
  ellipse(width/2,height/2,500,100);
  ellipse(width/2,height/2,500,50);
  ellipse(width/2,height/2,500,0);
  
  ellipse(width/2,height/2,500,500);
  ellipse(width/2,height/2,450,500);
  ellipse(width/2,height/2,400,500);
  ellipse(width/2,height/2,350,500);
  ellipse(width/2,height/2,300,500);
  ellipse(width/2,height/2,250,500);
  ellipse(width/2,height/2,200,500);
  ellipse(width/2,height/2,150,500);
  ellipse(width/2,height/2,100,500);
  ellipse(width/2,height/2,50,500);
  ellipse(width/2,height/2,0,500);
  
  r+= 1;
 println(r+1);

 
  
  
  

}
