PShader shader;

void setup() {
  size(720, 480, P2D);
  shader = loadShader("pattern13.glsl");
}

void draw() {
  shader.set("iMouse", float(mouseX), float(mouseY), float(pmouseX), float(pmouseY));
  shader.set("iTime", millis() / 1000.0);
  shader.set("iResolution", float(width), float(height));
  shader(shader);
  rect(0, 0, width, height);
}
