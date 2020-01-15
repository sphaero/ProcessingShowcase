
float C;
float S = 10;

void setup (){
  size (640,360);
  background (255);
  C = 0;
}

void draw (){
 background (155,25,50);
  fill (255,255,255);
  noStroke();
   fill (255,255,255);
 rect (C,10,80,30);
 rect (C,90,80,30);
 rect (C,50,80,30);
 rect (C,130,80,30);
 rect (C,170,80,30);
 rect (C,210,80,30);
 rect (C,250,80,30);
 rect (C,290,80,30);
 rect (C,330,80,30);

 rect (265,C,80,30);
 rect (350,C,80,30);
 rect (435,C,80,30);
 rect (520,C,80,30);
 rect (605,C,80,30);

 C = C + S;
 if (C > height){
   S = - 20;
 }
 if (C < 0){
   S = 13;
 }
 if (C > height/2){
   background (380,65,85);
 }
}
