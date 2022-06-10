// example circle animation manually speed matched to the music 



void setup()
{
  size(720,480);
}

void draw()
{
  background(0);
  fill(0,225,102 );
  float speed = 0.23;
  float delta = sin(frameCount*speed)*100;
  translate(width/2, height/2);
  circle(0,0,100+delta);
 
 fill( 224,224,224);
 circle(-200+delta, 0, random(100+delta*2));

fill( 224,224,224);
 circle(200-delta, 0, random(100+delta*2));

}
