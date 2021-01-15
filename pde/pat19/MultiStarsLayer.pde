class MultiStarsLayer {
  int count = 100;
  Star[] stars = new Star[count];
  color[] colors = {
    color(255, 0, 84),
    color(158, 0, 89),
    color(255, 84, 0),
    color(255, 189, 0)
  };
  
  int starWidth = 8;
  int starLength = 36;
  
  MultiStarsLayer() {
     for (int i = 0; i < count; i++) {
       int x = (int)random(0, width);
       int y = (int)random(0, height);
       color c = colors[(int)random(0, colors.length - 1)];
       stars[i] = new Star(x, y, starWidth, starLength, c);
     }
  }
  
  public void update() {
    for (int i = 0; i < count; i++) {
      Star s = stars[i];
      s.x = (int)random(0, width);
      s.y = (int)random(0, height);
    }
  }
  
  public void draw(PGraphics context) {
    for (int i = 0; i < count; i++) {
      Star s = stars[i];
      
      s.draw(context);
    }
  }
}
