void setup() {
  size( 720, 480);
}
float Ay1 = 160;
float Ay2;
float Ax1 = 360;
float Ax2;
float By1 = 160;
float By2;
float Bx1 = 360;
float Bx2;
float Cy1 = 160;
float Cy2;
float Cx1 = 360;
float Cx2;
float Dy1 = 160;
float Dy2;
float Dx1 = 360;
float Dx2;
int timeA;
int timeB = 1200;
float time;
float posx;
float posx2;
int teller;

void draw()
{
teller = teller + 1;

background(0,0,200);

//if (teller > 10) { 
// background(255);
// teller = 0;
//} else { 
//  background(0,0,200);
//} 

//sin
time = time + 1;
posx = (sin(time/18)*30);
posx2 = (sin(time/18+24)*30);

//environment
stroke(255);
strokeWeight(4);
line(140,480,360,160);
line(580,480,360,160);
strokeWeight(2);
line(0,159,720,159);

//beginShape();
//curveVertex(0, 200);
//curveVertex(0, 200);
//curveVertex(360, 160);
//curveVertex(720, 200);
//curveVertex(720, 200);
//endShape();


//moving roadlines
timeA = timeA + 1;
if (timeA >= 0)
{
Ay1 = Ay1 + 1.5;
Ay2 = Ay2 + 0.6;
Ax1 = Ax1 - 0.05;
Ax2 = Ax2 + 0.1;
rect(Ax1,Ay1,Ax2,Ay2);
}

if (timeA >= 100)
{
By1 = By1 + 1.5;
By2 = By2 + 0.6;
Bx1 = Bx1 - 0.05;
Bx2 = Bx2 + 0.1;
rect(Bx1,By1,Bx2,By2);
}

if (timeA == 400)
{
timeA = 0;
Ay1 = 160;
Ay2 = 0;
Ax1 = 360;
Ax2 = 0;
By1 = 160;
By2 = 0;
Bx1 = 360;
Bx2 = 0;
}

timeB = timeB - 1;
if (timeB <= 1000)
{
Cy1 = Cy1 + 1.5;
Cy2 = Cy2 + 0.6;
Cx1 = Cx1 - 0.05;
Cx2 = Cx2 + 0.1;
rect(Cx1,Cy1,Cx2,Cy2);
}

if (timeB <= 900)
{
Dy1 = Dy1 + 1.5;
Dy2 = Dy2 + 0.6;
Dx1 = Dx1 - 0.05;
Dx2 = Dx2 + 0.1;
rect(Dx1,Dy1,Dx2,Dy2);
}

if (timeB == 600)
{
timeB = 1000;
Cy1 = 160;
Cy2 = 0;
Cx1 = 360;
Cx2 = 0;
Dy1 = 160;
Dy2 = 0;
Dx1 = 360;
Dx2 = 0;
}

//rectangles
rect(285+posx,328,10,4);
rect(426+posx,328,10,4);
strokeWeight(0);
stroke(0,0,200);
fill(0,0,200);
rect(350+posx,300,20,70);
rect(310+posx,300,100,65);
triangle(340+posx,364,350+posx,365,350+posx,370);
triangle(381+posx,364,370+posx,364,370+posx,370);



//car
strokeWeight(2);
stroke(255);
line(320+posx,300,400+posx,300);
line(320+posx,300,300+posx,320);
line(400+posx,300,420+posx,320);
line(290+posx,321,430+posx,321);
line(290+posx,321,280+posx,326);
line(280+posx,326,275+posx,336);
line(430+posx,321,440+posx,326);
line(440+posx,326,445+posx,336);
line(275+posx,336,445+posx,336);
line(275+posx,336,277+posx,355);
line(445+posx,336,443+posx,355);
line(277+posx,355,295+posx,355);
line(295+posx,355,310+posx,336);
line(443+posx,355,425+posx,355);
line(425+posx,355,410+posx,336);
line(300+posx,336,310+posx,321);
line(420+posx,336,410+posx,321);
line(295+posx,355,305+posx,365);
line(425+posx,355,415+posx,365);
line(305+posx,365,340+posx,365);
line(415+posx,365,380+posx,365);
line(340+posx,365,350+posx,360);
line(340+posx,365,350+posx,370);
line(380+posx,365,370+posx,360);
line(380+posx,365,370+posx,370);
line(350+posx,370,370+posx,370);
line(350+posx,360,370+posx,360);

//wheels
line(279+posx,355,277+posx,375);
line(277+posx,375,310+posx,375);
line(310+posx,375,311+posx,365);
line(441+posx,355,443+posx,375);
line(443+posx,375,408+posx,375);
line(408+posx,375,407+posx,365);

//stripes
line(279+posx,375,269+random(100)/5+posx2,375+random(120)/3);
line(289+posx,375,281+random(100)/7+posx2,375+random(120)/2);
line(299+posx,375,293+random(100)/8+posx2,375+random(120)/2);
line(308+posx,375,303+random(100)/10+posx2,375+random(120)/3);

line(439+posx,375,449-random(100)/5+posx2,375+random(120)/3);
line(429+posx,375,437-random(100)/7+posx2,375+random(120)/2);
line(419+posx,375,425-random(100)/8+posx2,375+random(120)/2);
line(409+posx,375,414-random(100)/10+posx2,375+random(120)/3);




//line(280,350,440,350);
//line(245,361,245,390);
//line(475,361,475,390);




}
