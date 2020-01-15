class Drop {
  float x = random(0,720);
  float y = random(-200,-100);
  float yspeed = random(4, 10);
  float len = random(10, 20);
 
 void fall() {
   y = y +yspeed;
   yspeed = yspeed + 0.05;
   
   if (y > height) {
   y = random(-200,-100);
   yspeed = random(4, 10);
   }
 }
 
 void show(){
  stroke(210, 210, 255);
  line(x,y,x,y+20); 
 }
 
}
