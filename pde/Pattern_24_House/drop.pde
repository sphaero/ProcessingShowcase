class Drop {
  float x = random(0,720);
  float y = random(-500,-100);
  float z = random (0,20);
  float len = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 4, 10);
 
 void fall() {
   y = y +yspeed;
   yspeed = yspeed + 0.05;
   
   if (y > height) {
   y = random(-200,-100);
   yspeed = map(z, 0, 20, 4, 10);
   }
 }
 
 void show(){
   float thick = map (z, 0, 20, 1, 3);
   strokeWeight(thick);
  stroke(210, 210, 255);
  line(x,y,x,y+20); 
 }
 
}
