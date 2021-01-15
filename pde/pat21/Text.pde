class Text {
  private float x;
  private float y;
  private float size;
  private String text;
  private color textColor;
  private PFont textFont;
  private float hideAfterTime;
  private float currentTime = 0;

  Text(float x, float y, float size, String text, color textColor, float hideAfterTime) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.text = text;
    this.textColor = textColor;
    this.hideAfterTime = hideAfterTime;

    textFont = createFont(dataPath("pricedow.ttf"), 100);
  }

  void update(float delta) {
    if (currentTime < hideAfterTime) {
      currentTime += delta;
    }
  }

  void draw() {
    if (currentTime < hideAfterTime) {
      fill(this.textColor);
      textAlign(LEFT, TOP);
      textFont(this.textFont, size);

      textAlign(CENTER);
      text(this.text, x, y);
    }
  }
}
