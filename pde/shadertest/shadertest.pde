PShader blur;

void setup() {
  size(640, 360, P2D);
  // Shaders files must be in the "data" folder to load correctly
  blur = loadShader("blur.glsl");
  blur.set("bla", millis());
  stroke(0, 102, 153);
  rectMode(CENTER);
}

void draw() {
  blur.set("bla", float(millis()));
  filter(blur);  
  rect(mouseX-75, mouseY, 150, 150); 
  ellipse(mouseX+75, mouseY, 150, 150);
}
