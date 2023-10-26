PImage img;

void setup() {
  size(720, 480);
  img = loadImage("mushroom.png");
  img.resize(420, 480);
  frameRate(24);
}

void draw() {
  background(245,0,0);
  textSize(20);
text("BOB_THE-BUILDER", 220, 400);


  float tiles = 300;
  float tileSize = width / tiles;
  float time = millis() * 0.001;
  float radiusMultiplier = map(sin(time), -1, 0.01, 0.01, 2);

  
  float xOffset = (width - img.width) / -2;
  float yOffset = (height - img.height) / -2;

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      
      int pixelX = int(x * tileSize + xOffset);
      int pixelY = int(y * tileSize + yOffset);

      color c = img.get(pixelX, pixelY);
      float b = map(brightness(c), 10, 255, 1, 0);

      float radius = tileSize * b * radiusMultiplier;
      push();
      translate(x * tileSize, y * tileSize);
      ellipse(0, 0, radius, radius);
      pop();
    }
  }
}
