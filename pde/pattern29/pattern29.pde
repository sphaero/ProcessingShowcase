import netP5.*;
import oscP5.*;

OscP5 oscP5;

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

float half_root3 = sqrt(3)/2;

int fps = 60;

// triangle radius
float tr = 48;
// triangle velocity
int tvx = 2;
int tvy = 1;
// previous triangles
int[] txs = new int[fps];
int[] tys = new int[fps];
int[] trgbs = new int[fps];

void setup() {
  size(720, 480);
  frameRate(fps);
  stroke(#ff0000);

  for (int i = 0; i < fps; i++) {
    txs[i] = width/2;
    tys[i] = height/2;
    trgbs[i] = #ffffff;
  }

  oscP5 = new OscP5(this, 6200);
}

void draw() {
  clear();
  background(77, 77, 255);

  fill(255);
  int cx = width / 2;
  int cy = height / 2;
  int r = 23;
  int d = 45;
  int xLeftEye = cx - d;
  int yLeftEye = cy;
  int xRightEye = cx + d;
  int yRightEye = cy;
  // when there is no beat
  if (channel2instr == 0) {
    // draw small circle
    circle(cx, cy, 180);
    // sleepy face
    // eyes
    arc(xLeftEye, yLeftEye, r*2, r*2, 0, PI);
    arc(xRightEye, yRightEye, r*2, r*2, 0, PI);
    // mouth
    line(cx - 15, cy + 30, cx + 15, cy + 30);
  }
  // when there is a beat
  else {
    // draw large circle
    circle(cx, cy, 240);

    //face
    fill(255, 180, 2);
    //draw mouth
    circle(cx, cy + 40, 45);
    //draw eyes
    circle(xLeftEye, yLeftEye, r * 2);
    circle(xRightEye, yRightEye, r * 2);

    // draw pupils
    fill(77, 77, 255);
    int prevFrame = (frameCount - 1) % fps;
    int tx = txs[prevFrame];
    int ty = tys[prevFrame];

    float vecScaleLeft = sqrt((tx - xLeftEye) * (tx - xLeftEye) + (ty - yLeftEye) * (ty - yLeftEye)) * 2 / r;
    float xLeftPupil = xLeftEye + (tx - xLeftEye) / vecScaleLeft;
    float yLeftPupil = yLeftEye + (ty - yLeftEye) / vecScaleLeft;
    circle(xLeftPupil, yLeftPupil, r);
    
    float vecScaleRight = sqrt((tx - xRightEye) * (tx - xRightEye) + (ty - yRightEye) * (ty - yRightEye)) * 2 / r;
    float xRightPupil = xRightEye + (tx - xRightEye) / vecScaleRight;
    float yRightPupil = yRightEye + (ty - yRightEye) / vecScaleRight;
    circle(xRightPupil, yRightPupil, r);
  }

  int frame = frameCount % fps;

  int tx = 0;
  int ty = 0;
  // draw previous triangles
  for (int i = 0; i < fps; i++) {
    int f = (frame + i) % fps;
    tx = txs[f];
    ty = tys[f];
    fill(trgbs[f]);
    triangleFromCenter(tx, ty, tr);
  }

  // update from last triangle
  tx += tvx;
  ty += tvy;
  bounce(tx, ty, tr);
  tx += tvx;
  ty += tvy;
  txs[frame] = tx;
  tys[frame] = ty;
  // update color
  int c = 0;
  if (channel2instr == 0) {
    c = #ffffff;
  } else {
    c = #f6d42c;
  }
  fill(c);
  trgbs[frame] = c;
  // draw new triangle
  triangleFromCenter(tx, ty, tr);
}

void triangleFromCenter(int cx, int cy, float radius) {
  triangle(
    cx, cy - radius,
    cx - (radius * half_root3), cy + (radius / 2),
    cx + (radius * half_root3), cy + (radius / 2)
    );
}

void bounce(int cx, int cy, float radius) {
  if (cx - (radius * half_root3) < 0 || cx + (radius * half_root3) > width) {
    tvx = -tvx;
  }
  if (cy - radius < 0 || cy + (radius / 2) > height) {
    tvy = -tvy;
  }
}

void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/patternevent" )) {
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");
    //print(" addrpattern: "+message.addrPattern());
    //println(" typetag: "+message.typetag());

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
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    //feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |",
    //  patternnr, patternrow,
    //  channel1note, channel1instr, channel1effect, channel1effect_param,
    //  channel2note, channel2instr, channel2effect, channel2effect_param,
    //  channel3note, channel3instr, channel3effect, channel3effect_param,
    //  channel4note, channel4instr, channel4effect, channel4effect_param
    //  );
    //println(feedback_formatted);
  }
}
