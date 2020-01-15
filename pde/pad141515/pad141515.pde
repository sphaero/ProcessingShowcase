int screen_width = 630;
int screen_height = 360;

int AX = (screen_width/2) - 10;
int BX = (screen_height/2) - 10;

float a = 1;               //pas aan voor andere curve
float b = 3;
float delta = PI/2;        //curve van de "muis"
float curveX, curveY;
float t = 10;
float inc_t = 0.01;
//Curve
float x;
float y;
float angle;              //statische hoek
float deltaAngle;         //dynamische hoek
color c;
color d;
//Rect
int count = 0;           // globale variabele voor de strobe functie
//Strobe
PImage bg;
//Image als achtergrond
int lineY = 0;
int lineX = 0;
//Lijn


void strobe(int freq){    // strobe functie die een getal als parameter krijgt 

  if (count == freq)     // als count gelijk is aan de meegegeven parameter (freq) 
  {
    background(255);     // dan achtergrond wit
    //background(bg);       // anders is de achtergrond afbeelding
    count = 0;           // zet count weer terug op 0
  } else
  {
    //background(bg);       //Uit! anders gaat de achtergrond afbeelding over de fade
  }
  count = count + 1;     // tel weer 1 verder
}


void setup() {
  
 loadSounds(87,98);
 
  size(640, 360);
  //bg = loadImage("BG2.jpeg");            //Laad hier de achtergrond
  y = random(height);                      //Rect begint op willekeurige hoogte
  x = -width*0.05;
  angle=0;
  deltaAngle=0.1;                          //Snelheid draaien
  c=color(255);
  rectMode(CENTER);                         //Bij aanpassen past ook de strobe aan??
  smooth();
}

void draw() {
  
  //Sounds
  //print(currentPositie, currentPattern);
  playSounds();

  //Strobe
  strobe(10);                                 //Snelheid strobe
  noFill();
  noStroke();

  //Rect
  fill(0, 30);                                 //(x,y), x = echte background
  rect(width/2, height/2, width, height);    //past de strobe aan?
  c = color(0, map(curveX, 0, height, 255, 0), 0); 
  d = color(0, map(curveX, 0, height, 0, 0), 0);//MouseY verandert kleur
  fill(d);
  //noFill();
  stroke(c);
  //background(128);                          //Uit laten! Deze verwijderd de fade.
  if (mousePressed) {
    x = curveX;
    deltaAngle=deltaAngle*0.7;                //mousepressed rect blijft in beeld en stopt draaien
  } else 
  if (x<width) {
    x++;
    angle+=deltaAngle;
  } else {
    y = random(height);
    x = -width*.25;
    deltaAngle=random(-0.01, 0.1);
    //c=color(random(150,255),0,0);
  }
  pushMatrix();  
  translate(x, y);
  rotate(angle);
  float size = map(curveY, 0, width/2, 0.5, 1);
  rect(0, 0, width*0.4*size, height*0.25*size);
  popMatrix();

  //lijn 1
  stroke(2, 16, 258);
  line(0, lineY, width, lineY);
  lineY++;                                           //scanner
  lineY %= height;
  
  //lijn 2
   stroke(2, 258, 16);
  line(lineX, 0, width, width*4);
  lineX++;                                           //aanhangsel
  lineX %= height;
  
  //nepMuis
   smooth();
   curveX = AX*sin(a*t + delta) + screen_width/2;  //past curve aan voor kleur en maat
   curveY = BX*sin(b*t) + screen_height/2;
   
   t = t+inc_t;
}
