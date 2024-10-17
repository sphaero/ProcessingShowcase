import netP5.*;
import oscP5.*;

OscP5 oscP5;

float startTime, elapsedTime, endOfSustain;
boolean sustainOn;

float attack = 100; // in ms
float decay = 100; // in ms
float sustain = 0.6; // in percentage (0.5 = 50%)
float release = 500; // in ms

int lastPos;

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
  if (lastPos != ((patternrow + 1) / 64) * 4) {
    startTime = millis();
    lastPos = ((patternrow + 1) / 64 * 4);
  }
  
  println(lastPos);
  println(patternrow);

  background(0);
  noStroke();

  // rect(width/4 * 2, height/4 * 2, 100, 100);

  if (channel1instr != 0 )
  {
    rect((width/3) * 2, height/3, 100 + getEnvelopeValue(millis()) * 10, 100 + getEnvelopeValue(millis()) * 10);
  }
  if (channel2instr != 0 )
  {
    rect(width/3, height/3 * 2, 100 + getEnvelopeValue(millis()) * 10, 100 + getEnvelopeValue(millis()) * 10);
  }
  if (channel3instr != 0 )
  {
    rect(width/3 * 2, height/3 * 2, 100 + getEnvelopeValue(millis()) * 10, 100 + getEnvelopeValue(millis()) * 10);
  }
  if (channel4instr != 0 )
  {
    rect(width/3 * 2, height/3, 100 + getEnvelopeValue(millis()) * 10, 100 + getEnvelopeValue(millis()) * 10);
  }
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
    // Reset cycle
    startTime = millis();
    return 0;
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
