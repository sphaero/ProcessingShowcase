import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
// een integer die voor ons bijhoudt wanneer de Go stem wordt afgespeeld
int go_played = 0;

float angle;
float jitter;

void setup() {
  size(720,480);
  //  Laad de go.mod file in (let op bestandsnaam!)
  mplayer = new ModPlayer(this, dataPath("babey.mod"));
  //  play it rightaway
  mplayer.play();
}

/// go_draw_frame_count houdt bij hoe vaak we al getekend hebben
//
int go_draw_frame_count = 0;

// Deze functie gaat tekenen zodra de Go stem afgespeeld wordt
// Je kunt opgeven hoelang (aantal frames) hij moet tekenen.
void go_draw_for(int frames) // frames = het aantal frames dat je wilt tekenen
{
  if ( go_played == 1 )
  {
    go_draw_frame_count = frames;
    go_played = 0;
  }
  if (go_draw_frame_count != 0 )
  {
    //
    // Vanaf hier kun je je eigen draw dingen doen
    //
    int alpha = int((float(go_draw_frame_count) / frames) * 255); // maak een alpha waarde op basis van hoelang we al aan het tekenen zijn (fadeout effect)
  go_played=0; 
  fill(121, 134, 210);
  text("GO", 160, 140);
    textSize(100);
    fill(254, 237, 246);
  text("GO", 360, 240);
  textSize(200);
      fill(255, 83, 191);
  text("GO", 560, 40);
  textSize(50);
    fill(255, 83, 191);
  text("GO", 120, 290);
    textSize(100);
    fill(121, 134, 210);
  text("GO", 700, 300);
  textSize(200);
      fill(254, 237, 246);
  text("GO", 230, 60);
  textSize(50);
 
    //
    // einde draw dingen
    //
    go_draw_frame_count = go_draw_frame_count - 1;
  }
}

void draw() {
  background(0);
  go_draw_for(40);
  fill(255);
}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We reageren alleen op instrument 2
  if (instrument == 2)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    go_played = 1;
  }
}
