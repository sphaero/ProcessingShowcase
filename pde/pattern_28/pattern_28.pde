PImage mushroom;
float angle = 0;

void setup() {
  size(720, 480); // Change screen size to 720x480
  mushroom = loadImage("mushroom.png");
  
  if (mushroom != null) {
    mushroom.resize(350, 300);
  } else {
    println("Error loading image.");
  }
}

void draw() {
  background(#C813D6);
  translate(width/2, height/2);
  rotate(radians(angle));
  
  // Apply glitch effect
  for (int i = 0; i < mushroom.pixels.length; i++) {
    if (random(1) < 0.009) {
      mushroom.pixels[i] = color(random(255), random(255), random(255));
    }
  }
  
  mushroom.updatePixels();
  
  imageMode(CENTER);
  image(mushroom, 0, 0);
  angle += 1; // Increase the angle to make the mushroom spin
}
