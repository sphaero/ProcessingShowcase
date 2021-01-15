class World {
  StarLayer starLayer;
  MultiStarsLayer multiStarsLayer;
  Time time;


  World() {
    time = new Time();
    starLayer = new StarLayer();
    multiStarsLayer = new MultiStarsLayer();
  }

  public void beatUpdate() {
    multiStarsLayer.update();
  }

  public void update() {
    time.update();
    starLayer.update(time.deltaTimeInSeconds);
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

      if (a != 1) {
        multiStarsContext.pixels[i] = color(57, 0, 153);
      }
    }

    image(multiStarsContext, 0, 0);
  }
}
