float xoff = 0.0;


void setup()
{
  size(720,480);
}

void draw()
{
 background(0);
 //stroke(255);
 noStroke();
  xoff = xoff + .023;
  float n = noise(xoff) * width;

    fill(0,225,102 );
  float speed = 0.23;
  float speed2 = 0.115;
  float delta = sin(frameCount*speed)*100;
  float delta2 = sin(frameCount*speed2)*100;
   triangle(520,n, delta, 720-delta, 480-delta2, 280);
      triangle(n, 200, delta, 100, n+delta, delta2);
   fill(255);
   triangle(400,-n, 720-delta2, 300-delta, 480-delta, 600);

     triangle(200,n, delta, delta,delta2,400);

   fill(0,225,102);
  translate(width/2, height/2);
  circle(0,0,100+delta);
 
 fill( 224,224,224);
 circle(-200+delta, 0, random(100+delta2*2));

fill( 224,224,224);
 circle(200-delta, 0, random(100+delta2*2));

}

  


 
