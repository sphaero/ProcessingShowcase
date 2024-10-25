import netP5.*;
import oscP5.*;

OscP5 oscP5;

// spotlights
int direction = 0; // 0 is right, 1 is left
float rotation = 0;
int lastPatternRow = -1;  // keeps track of the last pattern row

// envelope
float startTime, elapsedTime, endOfSustain;
boolean sustainOn;

float attack = 25; // in ms
float decay = 50; // in ms
float sustain = 0.9; // in percentage (0.5 = 50%)
float release = 300; // in ms

int lastPos;


// cube 
float baseSize = 50;
float angleX, angleY;
float xRotationSpeed = 0.01; // Rotation speed on x-axis
float yRotationSpeed = 0.02; // ditto for y-axis


// gazebosc 
int songposition = 0;
int patternnr = 0;
int patternrow = 0;
int channel1instr = 0;
int channel2instr = 0;
int channel3instr = 0;
int channel4instr = 0;
int channel1note = 0;
int channel2note = 0;
int channel3note = 0;
int channel4note = 0;
char channel1effect;
char channel2effect;
char channel3effect;
char channel4effect;
String channel1effect_param = "00";
String channel2effect_param = "00";
String channel3effect_param = "00";
String channel4effect_param = "00";
String feedback_formatted = "";

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this, 6200);

  startTime = millis();
  sustainOn = false;
  lastPos = 0;
}

void draw()
{
  // Trigger envelope every 4 rows
  if (patternrow % 4 == 0) {
    startTime = millis();
  }

  background(0);
  elapsedTime = millis() - startTime; 
  
  
  // ===== Cube =====
  pushMatrix();
  translate(width / 2, height / 2);
  drawCube(50 + getEnvelopeValue(elapsedTime) * 50, 255, 67, 101);
  angleX = angleX + xRotationSpeed;
  angleY = angleY + yRotationSpeed;
  popMatrix();
  
  // ===== Cube =====
  pushMatrix();
  translate(width / 4, height / 2);
  drawCube(25 + getEnvelopeValue(elapsedTime) * 25, 0, 217, 192);
  popMatrix();
  
  pushMatrix();
  translate((width / 4) * 3, height / 2);
  drawCube(25 + getEnvelopeValue(elapsedTime) * 25, 183, 173, 153);
  popMatrix();
  
  
  // ===== Spotlights =====
  // Handle direction switch
  if (patternrow % 8 == 0 && patternrow != lastPatternRow) {
    if (direction == 1) {
      direction = 0;
      rotation = -0.6;
    } else {
      direction = 1;
      rotation = 0.6;
    }
    lastPatternRow = patternrow;  // Needed because otherwise sometimes direction doesn't change properly, perhaps it's not able to process every row. 
  }
  
  // Adjust rotation based on direction
  if (direction == 0) {
    if (rotation < 0.6) {
      rotation += 0.03;
    } 
  } else {
    if (rotation > -0.6) {
      rotation -= 0.03;
    } else {
      rotation = -0.65;
    }
  }
  

  pushMatrix();
  noStroke();
  translate(240, -25);
  rotate(PI * sin(rotation)); // range -0.6 tot 0.6
  generateSpotlight();
  popMatrix();
  
  pushMatrix();
  translate(480, -25);
  rotate(PI * sin(rotation)); // range -0.6 tot 0.6
  generateSpotlight();
  popMatrix();
}

float getEnvelopeValue(float t) {
  if (t <= attack) {
    // Attack
    return map(t, 0, attack, 0, 1);
  } else if (t <= attack + decay) {
    // Decay
    return map(t, attack, attack + decay, 1, sustain);
  } else if (sustainOn) {
    // Sustain
    return sustain;
  } else if (t <= attack + decay + release) {
    // Release
    return map(t, attack + decay, attack + decay + release, sustain, 0);
  } else {
    return 0.0;
  }
}

void generateSpotlight() {
  beginShape();
  fill(255, 255, 255, 128);
  vertex(0, 0); // top
  vertex(300, 1500); // Bottom left of the beam
  vertex(-300, 1500); // Bottom right of the beam
  endShape(CLOSE);
}

// Draws & rotates cube
void drawCube(float size, float r, float g, float b) {
  PVector[] corners = new PVector[8];
  
  corners[0] = new PVector(-size, -size, -size);
  corners[1] = new PVector(size, -size, -size);
  corners[2] = new PVector(size, size, -size);
  corners[3] = new PVector(-size, size, -size);
  corners[4] = new PVector(-size, -size, size);
  corners[5] = new PVector(size, -size, size);
  corners[6] = new PVector(size, size, size);
  corners[7] = new PVector(-size, size, size);
  
  // Rotate the corners
  for (PVector corner : corners) {
    // Rotate around X-axis
    float tempY = corner.y * cos(angleX) - corner.z * sin(angleX);
    float tempZ = corner.y * sin(angleX) + corner.z * cos(angleX);
    corner.y = tempY;
    corner.z = tempZ;

    // Rotate around Y-axis
    float tempX = corner.x * cos(angleY) + corner.z * sin(angleY);
    tempZ = -corner.x * sin(angleY) + corner.z * cos(angleY);
    corner.x = tempX;
    corner.z = tempZ;
  }
  
  stroke(r, g, b);
  for (int i = 0; i < 4; i++) {
    line(corners[i].x, corners[i].y, corners[(i + 1) % 4].x, corners[(i + 1) % 4].y); // Front face
    line(corners[i + 4].x, corners[i + 4].y, corners[(i + 1) % 4 + 4].x, corners[(i + 1) % 4 + 4].y); // Back face
    line(corners[i].x, corners[i].y, corners[i + 4].x, corners[i + 4].y); // Connect front and back
  }
}

void oscEvent(OscMessage message)
{
  if (message.checkAddrPattern("/patternevent" ) )
  {
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");
    songposition = message.get(0).intValue();
    patternnr = message.get(1).intValue();
    patternrow = message.get(2).intValue();

    channel1note = message.get(3).intValue();
    channel1instr = message.get(4).intValue();
    channel1effect = message.get(5).charValue();
    channel1effect_param = message.get(6).stringValue();
    channel2note = message.get(7).intValue();
    channel2instr = message.get(8).intValue();
    channel2effect = message.get(9).charValue();
    channel2effect_param = message.get(10).stringValue();
    channel3note = message.get(11).intValue();
    channel3instr = message.get(12).intValue();
    channel3effect = message.get(13).charValue();
    channel3effect_param = message.get(14).stringValue();
    channel4note = message.get(15).intValue();
    ;
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |",
      patternnr, patternrow,
      channel1note, channel1instr, channel1effect, channel1effect_param,
      channel2note, channel2instr, channel2effect, channel2effect_param,
      channel3note, channel3instr, channel3effect, channel3effect_param,
      channel4note, channel4instr, channel4effect, channel4effect_param
      );
    println( feedback_formatted );
  }
}
