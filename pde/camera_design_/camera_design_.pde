void setup () {
  size(900, 600); //   0 > 400 Links naar rechts, boven naar beneden
  background (55, 100, 0);
}

void draw () {


  // body top panel
  fill (25, 31, 34);
  rect (220, 90, 160, 100, 80);



  //shutterbutton
  fill (25, 31, 34);
  rect (155, 110, 30, 30, 5);

    //body camera
    fill (25, 31, 34);
  rect (125, 120, 350, 205, 25);  //1e 2 parameters zijn voor de locatie van de linker bovenhoek

// lens knopje
  fill(20, 20, 0);
  ellipse (350, 264, 25, 25);
  
  //lens outor
  fill (128, 128, 128);
  ellipse (300, 230, 120, 125);

  //lens innor

  fill (0);
  ellipse (300, 230, 105, 110);
  
  
  //flash
   fill (25, 31, 34);
  rect (400, 120, 68, 20, 5);  //1e 2 parameters zijn voor de locatie van de linker bovenhoek

}
