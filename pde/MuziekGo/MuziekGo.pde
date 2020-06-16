import procmod.*;


// een integer die voor ons bijhoudt wanneer de Go stem wordt afgespeeld
int go_played = 0;

int roze = #F0278B;
int blauw = #2A2EE8;

float s = 0;
float s2 = 0;
float s3 = 0;
float s4 = 0;
float s5 = 0;
float s6 = 0;
float s7 = 0;
float s8 = 0;
float s9 = 0;
float s10 = 0;
float s11 = 0;
float s12 = 0;
float s13 = 0;
float s14 = 0;
float s15 = 0;
float s16 = 0;
float s17 = 0;
float s18 = 0;
float s19 = 0;
float s20 = 0;
float s21 = 0;
float s22 = 0;
float s23 = 0;

ModPlayer mplayer;
void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("patt4.mod"));
  //  play it rightaway
  mplayer.play();
  noStroke();
  s = 0;
  s2 = 0;
  s3 = 0;
  s4 = 0;
  s5 = 0;
  s6 = 0;
  s7 = 0;
  s8 = 0;
  s9 = 0;
  s10 = 0;
  s11 = 0;
  s12 = 0;
  s13 = 0;
  s14 = 0;
  s15 = 0;
  s16 = 0;
  s17 = 0;
  s18 = 0;
  s19 = 0;
  s20 = 0;
  s21 = 0;
  s22 = 0;
  s23 = 0;

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
    fill(0);
    s = 0.0;
    rect(0,0,1000,1000);
    fill(random(255),random(255),100);
    
    
      textSize(100);
      text("GO", random(1,700), random(1,450));
    
    //
    // einde draw dingen
    //
    go_draw_frame_count = go_draw_frame_count - 1;
  }
}

void draw() {
  background(0);     
  pushMatrix();    
    fill(blauw, 95);
    translate(width/2,height/2);
    if (frameCount > 5 ) {
      scale(s);
     ellipse(0,0,200,200);
     s = s + 0.1;
    }
      
   if( frameCount > 10 ) { 
     fill(roze,95);
     scale (s2);
     ellipse(0,0,200,200);
     s2 = s2 + 0.01;
   }
   
   if( frameCount > 15) {
    fill(blauw,95);
    scale (s3);
    ellipse(0,0,10,10);
    s3 = s3 + 0.1;
   }
  
  if(frameCount > 20){
    fill(roze,95);
    scale (s4);
    ellipse(0,0,10,10);
    s4 = s4 + 0.01;
  }
  
   if( frameCount > 25) {
    fill(blauw,100);
    scale (s5);
    ellipse(0,0,10,10);
    s5 = s5 + 0.005;
   }
   
    if(frameCount > 30){
    fill(roze,95);
    scale (s6);
    ellipse(0,0,10,10);
    s6 = s6 + 0.01;
  }
  
  if( frameCount > 35) {
    fill(blauw,100);
    scale (s7);
    ellipse(0,0,10,10);
    s7 = s7 + 0.005;
   }
   
    if(frameCount > 40){
    fill(roze,95);
    scale (s8);
    ellipse(0,0,10,10);
    s8 = s8 + 0.01;
  }
  
  if( frameCount > 45) {
    fill(blauw,100);
    scale (s9);
    ellipse(0,0,10,10);
    s9 = s9 + 0.005;
   }
   
   if(frameCount > 50){
    fill(roze,95);
    scale (s9);
    ellipse(0,0,10,10);
    s9 = s9 + 0.01;
  }
  
  if( frameCount > 55) {
    fill(blauw,100);
    scale (s10);
    ellipse(0,0,10,10);
    s10 = s10 + 0.005;
   }
   
     if(frameCount > 60){
    fill(roze,95);
    scale (s11);
    ellipse(0,0,10,10);
    s11 = s11 + 0.01;
  }
    
    if( frameCount > 65) {
    fill(blauw,100);
    scale (s12);
    ellipse(0,0,10,10);
    s12 = s12 + 0.005;
   }
   
    if(frameCount > 70){
    fill(roze,95);
    scale (s13);
    ellipse(0,0,10,10);
    s13 = s13 + 0.005;
  }
  
  if( frameCount > 75) {
    fill(blauw,100);
    scale (s14);
    ellipse(0,0,10,10);
    s14 = s14 + 0.005;
   }
   
    if(frameCount > 80){
    fill(roze,95);
    scale (s15);
    ellipse(0,0,10,10);
    s15 = s15 + 0.005;
  }
  
   if( frameCount > 85) {
    fill(blauw,100);
    scale (s16);
    ellipse(0,0,10,10);
    s16 = s16 + 0.005;
   }
   
   if(frameCount > 90){
    fill(roze,95);
    scale (s17);
    ellipse(0,0,10,10);
    s17 = s17 + 0.005;
  }
  
  if( frameCount > 95) {
    fill(blauw,100);
    scale (s18);
    ellipse(0,0,10,10);
    s18 = s18 + 0.005;
   }
   
    if(frameCount > 100){
    fill(roze,95);
    scale (s19);
    ellipse(0,0,10,10);
    s19 = s19 + 0.005;
  }
  
  if( frameCount > 105) {
    fill(blauw,100);
    scale (s20);
    ellipse(0,0,10,10);
    s20 = s20 + 0.005;
   }
 
 if(frameCount > 110){
    fill(roze,95);
    scale (s21);
    ellipse(0,0,10,10);
    s21 = s21 + 0.005;
  }
  
  if( frameCount > 115) {
    fill(blauw,100);
    scale (s22);
    ellipse(0,0,10,10);
    s22 = s22 + 0.004;
   }
   
   if(frameCount > 120){
    fill(roze,95);
    scale (s23);
    ellipse(0,0,10,10);
    s23 = s23 + 0.005;
  }
  popMatrix();
  go_draw_for(10);
   
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
