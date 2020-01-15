int count = 0;    // globale variabele voor de strobe functie
int ypos = 0;     // globale variabele voor de y positie van de cirkel (ellips)
int ydelta = 20;  // globale variabele voor de snelheid van de cirkel 
int xpos = 0;


void setup() 
//{ loadSounds(99,103);

{ loadSounds(14,14);
  size(720,480);
  

}

//{ loadSounds(13,15);

  



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
  if (ypos >= height-100 )
  {
    ydelta = ydelta * -1;
  }
  if (ypos <= -1000)
  {
    ydelta = ydelta * -1;
  }
  
  noFill();
  stroke(10,20,20);
  strokeWeight(10);

  ellipse(width*2/3,height/2,ypos,ypos);
  ellipse(width*2/3,height/2,ypos+100,ypos+10); //ooglid
  ellipse(width*2/3,height/2,ypos-100,ypos-100); 
  ellipse(width*2/3,height/2,ypos-200,ypos-200);
  ellipse(width*2/3,height/2,ypos+300,ypos+300);
  ellipse(width*2/3,height/2,ypos+200,ypos+200);
  ellipse(width*2/3,height/2,ypos+400,ypos+400);
  ellipse(width*2/3,height/2,ypos+500,ypos+500);
  ellipse(width*2/3,height/2,ypos+600,ypos+600);
  ellipse(width*2/3,height/2,ypos+700,ypos+700);
  ellipse(width*2/3,height/2,ypos+800,ypos+800);
  ellipse(width*2/3,height/2,ypos+900,ypos+900);
  ellipse(width*2/3,height/2,10,10); //oog
  
    ellipse(width/3,height/2,ypos,ypos);
  ellipse(width/3,height/2,ypos+100,ypos+10); //ooglid
  ellipse(width/3,height/2,ypos-100,ypos-100); 
  ellipse(width/3,height/2,ypos-200,ypos-200);
  ellipse(width/3,height/2,ypos+300,ypos+300);
  ellipse(width/3,height/2,ypos+200,ypos+200);
  ellipse(width/3,height/2,ypos+400,ypos+400);
  ellipse(width/3,height/2,ypos+500,ypos+500);
  ellipse(width/3,height/2,ypos+600,ypos+600);
  ellipse(width/3,height/2,ypos+700,ypos+700);
  ellipse(width/3,height/2,ypos+800,ypos+800);
  ellipse(width/3,height/2,ypos+900,ypos+900);
  ellipse(width/3,height/2,10,10); //oog
  
  

}
