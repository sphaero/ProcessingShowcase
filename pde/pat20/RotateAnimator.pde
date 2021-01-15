interface RotateAnimatorDelegate {
  void drawInRotateAnimator(PGraphics context, RotateAnimator animator);
}

enum RotateAnimatorDirection {
  CLOCKWISE,
  COUNTER_CLOCKWISE,
}

class RotateAnimator {
  RotateAnimatorDelegate delegate;
  RotateAnimatorDirection direction;
  float rotateTime;

  String name;
  float currentTime = 0;
  float angle = 0;
  int x;
  int y;

  RotateAnimator(String name, float rotateTime, RotateAnimatorDelegate delegate, int x, int y, RotateAnimatorDirection direction) {
    this.name = name;
    this.delegate = delegate;
    this.rotateTime = rotateTime;
    this.x = x;
    this.y = y;
    this.direction = direction;
  }

  public void update(float delta) {
    currentTime += delta;
    currentTime %= rotateTime;

    angle = PI * map(this.currentTime, 0, this.rotateTime, 0, 2);
  }

  public void draw(PGraphics context) {
    context.pushMatrix();
    context.translate(x, y);
    if (direction == RotateAnimatorDirection.CLOCKWISE) {
      context.rotate(angle);
    }
    else {
      context.rotate(-angle);
    }

    context.translate(-(height / 2), -(height / 2));

    delegate.drawInRotateAnimator(context, this);

    context.popMatrix();
  }
}
