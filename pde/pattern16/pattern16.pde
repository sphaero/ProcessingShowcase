PShader shader;

void setup() {
  size(720, 480, P2D);  // Gebruik P2D zodat we shaders kunnen gebruiken
  shader = loadShader("pattern16.glsl"); // Laad je GLSL shader bestand
}

void draw() {
  // Stel alle uniforme variabelen in die vaak in ShaderToy worden gebruikt
  shader.set("iMouse", float(mouseX), float(mouseY), float(pmouseX), float(pmouseY));
  shader.set("iTime", millis() / 1000.0); // iTime komt overeen met de tijd in seconden
  shader.set("iResolution", float(width), float(height)); // iResolution is de schermresolutie
  shader(shader); // Activeer de shader
  rect(0, 0, width, height); // Teken een rechthoek over het hele canvas, waarop de shader toegepast wordt
}
