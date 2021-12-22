int count = 0;    // globale variabele voor de strobe functie
int xpos = 0;     // globale variabele voor de y positie van de cirkel (ellips)
int xdelta = 10;  // globale variabele voor de snelheid van de cirkel 
int ypos = 0;
int ydelta = 10;

void setup() 

{
  loadSounds ();
  size(720,480);
  
}

void strobe(int freq)  // strobe functie die een getal als parameter krijgt 
{
  if (count == freq)   // als count gelijk is aan de meegegeven parametere (freq) 
  {
    background(255);   // dan achtergrond wit
    count = 0;         // zet count weer terug op 0
  }
  else
  {
    background(random(100,255),random(100,255),random(100,255));     // anders is de achtergrond zwart
 
}
  count = count + 10;   // tel weer 1 verder
}

void draw() 
{
  playSounds ();
  strobe(3);

  xpos = xpos + xdelta;
  if (xpos >= width )
  
  {
    xdelta = xdelta * -1;
  }
  if (xpos <= 0)
  {
    xdelta = xdelta * -1;
  }
      
      ypos = ypos + ydelta;
  if (ypos >= height )
  
  {
    ydelta = ydelta * -1;
  }
  if (ypos <= 0)
  {
    ydelta = ydelta * -1;
 
  
  }
  
  noFill();
  stroke(0);
  strokeWeight(5);
  fill(random(0,255));
  square(xpos,height/2, 20);
   fill(random(0,255),random(0,255),random(0,255));
  square(xpos-300, height/3, 30);
   fill(random(0,255),random(0,255),random(0,255));
  square(xpos+400,height/6,10);
   fill(random(0,255));
   square(xpos+600, height/4,90);
     fill(random(0,255),random(0,255),random(0,255));
  square(xpos-200, height/3, 70);
  
   fill(random(0,255));
  square(width/3, ypos, 20);
   fill(random(0,255),random(0,255),random(0,255));
  square(width/8, ypos-200, 50);
   fill(random(0,255),random(0,255),random(0,255));
  square(width/2, ypos-50, 30);
   fill(random(0,255));
  square(width/4, ypos+300, 40);
   fill(random(0,255),random(0,255),random(0,255));
  square(width/5, ypos-80, 80);
   fill(random(0,255));
  square(width/3, ypos+200, 90);
 
   
  
}
