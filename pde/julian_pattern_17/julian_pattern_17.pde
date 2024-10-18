import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = 0;
int patternnr = 0;
int patternrow = 0;


int channel1note = 0;


int marioX, marioY;
int luigiX, luigiY;
int bowserX, bowserY;
int spelerGrootte = 60; 
int zwaartekracht = 1;
int sprongKracht = 20; 
boolean marioSpringt = false;
boolean luigiSpringt = false;
boolean bowserSpringt = false;
int marioYVersnelling = 0;
int luigiYVersnelling = 0;
int bowserYVersnelling = 0;


Obstakel[] obstakels;
int aantalObstakels = 5;
int obstakelBreedte = 40; 
float obstakelSnelheid = 4; 
Wolk[] wolken;
int aantalWolken = 3;
Vis vis;

void setup() {
  size(720, 480); 
  marioX = 100; 
  luigiX = marioX + 80; 
  bowserX = 450; 
  marioY = luigiY = bowserY = height - 80; 

  oscP5 = new OscP5(this, 6200); 

  obstakels = new Obstakel[aantalObstakels];
  for (int i = 0; i < aantalObstakels; i++) {
    obstakels[i] = new Obstakel(random(width, width * 2), height - 90);
  }

  wolken = new Wolk[aantalWolken];
  for (int i = 0; i < aantalWolken; i++) {
    wolken[i] = new Wolk(random(width), random(40, 120));
  }

  vis = new Vis();
}

void draw() {
  background(100, 150, 255);
  fill(0, 128, 0);
  rect(0, height - 80, width, 80); 
  
  for (Obstakel obs : obstakels) {
    obs.beweeg();
    obs.teken();
  }

  for (Wolk wolk : wolken) {
    wolk.beweeg();
    wolk.teken();
  }

  vis.beweeg();
  vis.teken();

  // Mario springt
  if (marioSpringt) {
    marioY -= marioYVersnelling;
    marioYVersnelling -= zwaartekracht;

    if (marioY >= height - 80) {
      marioY = height - 80;
      marioSpringt = false;
      marioYVersnelling = 0;
    }
  }
  
  // Luigi springt
  if (luigiSpringt) {
    luigiY -= luigiYVersnelling;
    luigiYVersnelling -= zwaartekracht;

    if (luigiY >= height - 80) {
      luigiY = height - 80;
      luigiSpringt = false;
      luigiYVersnelling = 0;
    }
  }
  
  // Bowser springt
  if (bowserSpringt) {
    bowserY -= bowserYVersnelling;
    bowserYVersnelling -= zwaartekracht;

    if (bowserY >= height - 80) {
      bowserY = height - 80;
      bowserSpringt = false;
      bowserYVersnelling = 0;
    }
  }
  
  tekenMario(marioX, marioY);
  tekenLuigi(luigiX, luigiY); 
  tekenBowser(bowserX, bowserY); 
}

void tekenMario(int x, int y) {
  fill(255, 0, 0);
  rect(x + 10, y - 42, 30, 16); 
  fill(0, 0, 255);
  rect(x, y - 24, spelerGrootte, 30); 
  fill(255);
  ellipse(x + 30, y - 20, 18, 18); 
}

void tekenLuigi(int x, int y) {
  fill(0, 255, 0);
  rect(x + 10, y - 42, 30, 16); 
  fill(0, 0, 255);
  rect(x, y - 24, spelerGrootte, 30); 
  fill(255);
  ellipse(x + 30, y - 20, 18, 18); 
}

void tekenBowser(int x, int y) {
  fill(255, 165, 0);
  rect(x, y - 16, spelerGrootte, 42); 
  fill(0);
  ellipse(x + 30, y - 20, 18, 18); 
}

class Obstakel {
  float x, y;

  Obstakel(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void beweeg() {
    x -= obstakelSnelheid;
    if (x < -obstakelBreedte) {
      x = random(width, width * 2);
    }
  }

  void teken() {
    fill(139, 69, 19);
    rect(x, height - 90, obstakelBreedte, 30); 
  }
}

class Wolk {
  float x, y;

  Wolk(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void beweeg() {
    x -= 1;
    if (x < -50) {
      x = width + 50;
    }
  }

  void teken() {
    fill(255);
    noStroke();
    ellipse(x, y, 80, 40); 
    ellipse(x + 20, y + 10, 60, 30);
    ellipse(x - 20, y + 10, 60, 30);
    ellipse(x + 40, y, 40, 20);
    ellipse(x - 40, y, 40, 20);
  }
}

class Vis {
  float x, y;
  float snelheid;
  boolean isZichtbaar;

  Vis() {
    x = width + 50;
    y = random(40, 160);
    snelheid = random(4, 8); 
    isZichtbaar = false;
  }

  void beweeg() {
    if (isZichtbaar) {
      x -= snelheid;
      if (x < -20) {
        isZichtbaar = false;
      }
    } else if (frameCount % 120 == 0) {
      isZichtbaar = true;
      x = width + 20;
      y = random(40, 160);
    }
  }

  void teken() {
    if (isZichtbaar) {
      fill(255, 0, 0);
      ellipse(x, y, 40, 20); 
      
      fill(255);
      ellipse(x, y, 10, 10); 
     
      fill(255, 255, 0);
      ellipse(x - 20, y, 10, 6); 
    }
  }
}

void oscEvent(OscMessage msg) {
  String adres = msg.addrPattern();
  
  if (adres.equals("/patternevent")) {
    channel1note = msg.get(3).intValue();

    println("Channel 1 Note: " + channel1note);
    
    // Mario springt op channelnote 381
    if (channel1note == 381) {
      if (marioY >= height - 80) {
        marioSpringt = true;
        marioYVersnelling = sprongKracht;
        println("Mario springt!");
      }
    }
    
    // Luigi springt op channelnote 190
    if (channel1note == 190) {
      if (luigiY >= height - 80) {
        luigiSpringt = true;
        luigiYVersnelling = sprongKracht;
        println("Luigi springt!");
      }
    }

    // Bowser springt op channelnote 180
    if (channel1note == 180) {
      if (bowserY >= height - 80) {
        bowserSpringt = true;
        bowserYVersnelling = sprongKracht;
        println("Bowser springt!");
      }
    }
  }
}
