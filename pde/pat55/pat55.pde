PGraphics pg;

float fontSize;
int cols = 30;
int rows = 30;
float zoff = 0;
float xoffsp = 0.2;
float yoffsp = 0.2;
float zoffsp = 0.05;
float[][] sizes;
float[] multiplyerX;
float multiplyerY;
float mapCutter = 0.1;
float mapCutterSP = 0.025;
float mapCutterANG = 0;


void setup() {
size(740, 480, P2D);
pg = createGraphics(740, 480);
fontSize = pg.width/rows;
sizes = new float[cols][rows];
multiplyerX = new float[cols];
multiplyerY = 0;
noStroke();
}


void draw() {
mapCutterANG += mapCutterSP;
mapCutter = sin(mapCutterANG);
background(100);
float yoff = 0;
for (int y = 0; y < rows; y++) {
float xoff = 0;
for (int x = 0; x < cols; x++) {
sizes[x][y] = map(noise(xoff, yoff, zoff), -mapCutter, mapCutter, 0, 1);
xoff += xoffsp;
}

yoff += yoffsp;
}

zoff += zoffsp;
genTextre ();
updWidths();
display();
}


void updWidths() {
for (int y = 0; y < rows; y++) {
float sum = 0;
for (int x = 0; x < cols; x++) {
sum += sizes[x][y];
}

multiplyerX[y] = width/sum;
}

float sum = 0;
for (int y = 0; y < rows; y++) {
sum += sizes[0][y];
multiplyerY = height/sum;
}
}

void display() {
float texHCounter = 0;
float texHCounterStep = pg.width/cols;
float texWCounterStep = pg.height/rows;
float hcounter = 0;
for (int y = 0; y < rows; y++) {
float texWCounter = 0;
float wcounter = 0;
for (int x = 0; x < cols; x++) {
beginShape(QUAD);
textureMode(IMAGE);
texture(pg);
vertex(wcounter, hcounter, texWCounter, texHCounter);
vertex(wcounter+sizes[x][y]*multiplyerX[y], hcounter, texWCounter+texWCounterStep, texHCounter);
vertex(wcounter+sizes[x][y]*multiplyerX[y], hcounter+sizes[0][y]*multiplyerY, texWCounter+texWCounterStep, texHCounterStep+texHCounter);
vertex(wcounter, hcounter+sizes[0][y]*multiplyerY, texWCounter, texHCounterStep+texHCounter);
endShape();
wcounter += sizes[x][y]*multiplyerX[y];
texWCounter+=texWCounterStep;
}

texHCounter+=texHCounterStep;
hcounter+=sizes[0][y]*multiplyerY;
}
}

void genTextre () {
pg.beginDraw();
pg.background(0);
pg.textSize(fontSize);
pg.textAlign(CENTER, BOTTOM);
for (int y = 0; y < rows; y++) {
for (int x = 0; x < cols; x++) {
pg.pushMatrix();
pg.translate(x*fontSize+fontSize/2, y*fontSize+fontSize);
pg.fill(255);
pg.text("This is no video", 0, 0, 0);
pg.popMatrix();
}
}

pg.endDraw();
}
