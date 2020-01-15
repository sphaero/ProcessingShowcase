
float C;
float S = 10;

void setup (){
  size (640,360);
  background (255);
  C = 0;
}

void draw (){
 background (175,25,50);
  fill (255,255,255);
  noStroke();
 ellipse (450,C,30,100);
  fill (255,255,255);
 ellipse (550,C,30,100);

   fill (255,255,255);
 ellipse (250,C,30,100);
  fill (255,255,255);
 ellipse (350,C,30,100);
  fill (255,255,255);
 ellipse (150,C,30,100);
 C = C + S;
 if (C > height){
   S = - 20;
 }
 if (C < 0){
   S = 13;
 }
 if (C > height/2){
   background (random(0,255),random(0,255),random(0,255));
}
}
