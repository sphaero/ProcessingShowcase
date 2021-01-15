import procmod.*;

ModPlayer mplayer;
World world;

void setup() {
  size(720, 480);
  background(0);
  frameRate(30);
  world = new World();
  mplayer = new ModPlayer(this, dataPath("pat21.mod"));
  mplayer.play();
}

void draw() {
  world.update();
  world.draw();
}

void modRowEvent(int channel, int instrument, int note)
{
   world.beatUpdate(channel, instrument, note);
}
