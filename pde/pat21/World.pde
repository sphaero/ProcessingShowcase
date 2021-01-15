class World {
  StarLayer starLayer;
  MultiStarsLayer multiStarsLayer;
  Time time;
  Text text;
  
  
  World() {
    time = new Time();
    starLayer = new StarLayer();
    multiStarsLayer = new MultiStarsLayer();
  }

  public void beatUpdate(int channel, int instrument, int note) {
    if (channel == 2) {
      multiStarsLayer.update();
    }
    
    if (channel == 3) {
      if (instrument == 8) {
        text = new Text(width / 2, height / 2, 60, "Comedy", color(255, 189, 0), 0.6);
      }
      if (instrument == 9) {
        text = new Text(width / 2, height / 2, 60, "WHooooo", color(255, 189, 0), 0.4);
      }
    }
  }

  public void update() {
    time.update();
    starLayer.update(time.deltaTimeInSeconds);
    if (text != null) {
      text.update(time.deltaTimeInSeconds);
    }
  }
  
  public void draw() {
    background(0);
    PGraphics multiStarsContext = createGraphics(width, height);
    multiStarsContext.beginDraw();
    multiStarsLayer.draw(multiStarsContext);
    multiStarsContext.endDraw();
    
    PGraphics starContext = createGraphics(width, height);
    starContext.beginDraw();
    starLayer.draw(starContext);
    starContext.endDraw();
    
    for (int i = 0; i < multiStarsContext.pixels.length; i++) {
      int a = (int)red(starContext.pixels[i]);
      
      if (a == 1) {
        multiStarsContext.pixels[i] = color(57, 0, 153);
      }
    }
    
    image(multiStarsContext, 0, 0);
    
    if (text != null) {
      text.draw();
    }
  }
}
