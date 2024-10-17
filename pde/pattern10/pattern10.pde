import netP5.*;
import oscP5.*;

OscP5 oscP5;
float bpm = 31.25;  // 31,25 BPM
float amplitude = 260;  // Hoogte van de golven
float frequency = 0.05;  // Frequentie van de golven
int barWidth = 50;  // Breedte van de balken
float beatDuration;  // Tijd per beat in milliseconden

void setup() {
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this, 6200);
  
  // Bereken de tijd per beat in milliseconden
  beatDuration = (60.0 / bpm) * 1000;  // in milliseconden
}

void draw() {
  background(0);
  
  fill(225,255,243);
  beginShape();
  for (float x = 0; x < width; x += 1) 
  {
    // Use the sine function to create a wiggly effect
    float y = height / 2 + sin(x * frequency + frameCount * 0.05) * amplitude;
    vertex(x, y);  // Create the vertex at (x, y)
  }
  endShape();
  
  // Bereken hoeveel tijd is verstreken binnen de huidige beat
  float elapsedTime = millis() % beatDuration;
  
  // Bereken de voortgang van de huidige beat (waarde tussen 0 en 1)
  float progress = elapsedTime / beatDuration;
  
  // Gebruik de sinusoïde om de beweging op de beat te laten synchroniseren
  float waveShift = sin(TWO_PI * progress);  // Dit zorgt ervoor dat de golf op en neer gaat
  
  for (float x = 0; x < width; x += barWidth) {
    // Gebruik de waveShift om de hoogte van de balken te beïnvloeden
    float barHeight = sin(x * frequency + waveShift * TWO_PI) * amplitude;
    
    // Teken de bovenste balk
    fill(0, 217, 192);
    rect(x, height / 100 - barHeight / 2, barWidth, barHeight);
    
    // Teken de onderste balk
    fill(255, 67, 101);
    rect(x, height / 1 - barHeight / 2, barWidth, barHeight);
  }
}

void oscEvent(OscMessage message) 
{
  int patternnr = message.get(1).intValue();
  int patternrow = message.get(2).intValue();
  println(patternnr, patternrow);
}
