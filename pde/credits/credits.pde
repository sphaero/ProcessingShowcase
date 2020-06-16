import java.util.Collections;
import java.util.Arrays;

String[] nicknames = {"Dtrxch", "ilomax", "Asthettic", "Muurten", "Mother of Jezus", "Son of Maria", "Seal", "Sphaero", "Suusuki","Loyte", "Mr. Job","Eva", "jk", "Neurodancer"};
int[][] positions = {
                      {0,0},
                      {1,1},
                      {2,2},
                      {3,0},
                      {4,1},
                      {0,2},
                      {1,0},
                      {2,1},
                      {3,2},
                      {4,0},
                      {0,1},
                      {1,2},
                      {2,0},
                      {3,1},
                      {4,2},
                    };
int[][] positions2;
float start;
int roze = #F0278B;
int blauw = #2A2EE8;
PFont fnt;

void setup() {
  size(720,480);
  fnt = createFont("impact.ttf", 24);
  textFont(fnt);
  textSize(30);
  start = millis();
  Collections.shuffle(Arrays.asList(positions));
  positions2 = new int[positions.length][2];
  for(int i=0;i<positions.length;i++)
  {
    positions2[i][0] = positions[i][0]*80+80+int(random(-30,30));
    positions2[i][1] = positions[i][1]*200+100+int(random(-30,30));
  }
  background(0);
}

void draw() 
{
  textFont(fnt);
  textSize(36);
  background(0);
  float alpha = 1.0 - (millis() - start)/8000;
  for (int i=0;i<nicknames.length;i++)
  {
    int kleur = roze;
    if (i%2 == 0 ) kleur = blauw;
    int count = 1;
    while(count <10)
    {
      int dposx = int(random(7));
      int dposy = int(random(7));
      fill(kleur, 50 * alpha);
      if (count == 9 ) fill(kleur,250 * alpha);
      text(nicknames[i], positions2[i][1]+dposx, positions2[i][0]+dposy );
      count += 1;
    }
    
  }
}
