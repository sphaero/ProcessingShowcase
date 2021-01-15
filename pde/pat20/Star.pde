class Star {
  int x;
  int y;
  int w;
  int l;
  color starColor;
  
  Star(int x, int y, int w, int l, color starColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = l;
    this.starColor = starColor;
  }
  
  public void draw(PGraphics context) {
    context.noStroke();
    context.fill(starColor);
   
    context.pushMatrix();
    context.translate(x, y);

    this.drawLines(context);
     
    context.popMatrix();
  }
  
  private void drawLines(PGraphics context) {
     context.pushMatrix();
     context.translate((l / 2) - (w / 2), 0);
     context.rect(0, 0, w, l);
     context.popMatrix();
     
     context.pushMatrix();
     context.translate(0, (l / 2) + (w / 2));
     context.rotate(-(PI * 0.5));
     context.rect(0, 0, w, l);
     context.popMatrix();
     
     context.pushMatrix();
     context.translate((l / 2), (l / 2));
     context.rotate(-(PI * 0.25));
     context.translate(-(w / 2), -(l / 2));
     context.rect(0, 0, w, l);
     context.popMatrix();
     
     context.pushMatrix();
     context.translate((l / 2), (l / 2));
     context.rotate((PI * 0.25));
     context.translate(-(w / 2), -(l / 2));
     context.rect(0, 0, w, l);
     context.popMatrix();
  }
}
