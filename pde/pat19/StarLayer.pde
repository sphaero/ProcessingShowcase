class StarLayer implements RotateAnimatorDelegate {
  Star star;
  RotateAnimator rotateAnimator;
  
  int starLength = height;
  int starWidth = (int)(starLength / 4.5);
  
  StarLayer() {
    star = new Star(0, 0, starWidth, starLength, color(1, 0, 0));
    rotateAnimator = new RotateAnimator("StarRotater", 3, this, starLength / 2, starLength / 2, RotateAnimatorDirection.CLOCKWISE);
  }
  
  public void update(float delta) {
    rotateAnimator.update(delta);
  }
  
  public void draw(PGraphics context) {
    context.translate((width / 2) - (starLength / 2), 0);
    rotateAnimator.draw(context);
  }
  
  @Override
  public void drawInRotateAnimator(PGraphics context, RotateAnimator animator) {
    star.draw(context);
  }
}
