import procmod.*;


// een integer die voor ons bijhoudt wanneer de Go stem wordt afgespeeld
int go_played = 0;

int bgcolor = #F0278B;

ModPlayer mplayer;
void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt4.mod"));
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
    fill(#F0278B, alpha); 
    background(#F0278B);
    
    //
    // einde draw dingen
    //
    go_draw_frame_count = go_draw_frame_count - 1;
  }
}

void draw() {
  background(0);
  go_draw_for(40);
    fill(#2A2EE8, 100);
    scale(random(3));  
    ellipse(random(300),random(300),200,200);
    ellipse(random(100),random(300),200,200);
    ellipse(random(100),random(300),100,100);
    ellipse(random(100),random(300),500,500);
    fill(#F0278B);
    scale(random(1));
    ellipse(random(300),random(300),100,100);
    scale(random(1));
    ellipse(600,300,100,100);
    fill(100,255,0,50);
    scale(random(1));
    ellipse(random(600),random(340),100,100);
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
