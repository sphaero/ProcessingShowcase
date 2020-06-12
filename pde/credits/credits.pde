
String[] nicknames = {"ilomax", "Asthettic", "MariaSerberie", "Seal"};
int[][] positions; 
float start;

void setup() {
  size(720,480);
  textSize(20);
  start = millis();
  positions = new int[nicknames.length][2];
  for (int i=0;i<nicknames.length;i++)
  {
    int posx = int(random(500/20))* 19 + 100;
    int posy = int(random(400/10))* 9 + 40;
    positions[i][0] = posx;
    positions[i][1] = posy;
  }
  background(0);
}

void draw() 
{
  background(0);
  float alpha = 1 - (millis() - start)/4000;
  println(alpha);
  for (int i=0;i<nicknames.length;i++)
  {
    int count = 1;
    while(count <10)
    {
      int dposx = int(random(5));
      int dposy = int(random(5));
      fill(255, 50 * alpha);
      if (count == 9 ) fill(255,100 * alpha);
      text(nicknames[i], positions[i][0]+dposx, positions[i][1]+dposy );
      count += 1;
    }
  }
}
