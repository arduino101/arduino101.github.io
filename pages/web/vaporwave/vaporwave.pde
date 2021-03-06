var canvasX = window.innerWidth;
var canvasY = window.innerHeight;

//vaporwave
int sx = 120;
int sy = 100;
float mult;
float[][] points = new float[sx][sy];
int depth;
float curveFunktion(int x,int y) {
  return (((x-50)/200)^2)*50;
}
void drawRasterH(int y) {
  tinty(y);
  noFill();
  beginShape();
  for (int i = 0; i < sx; i++) {
    vertex(i*((float)width/sx), toZ(points[i][y], i,  y), y*(depth/sy));
  }
  endShape();
}
void drawRasterV(int x) {
  noFill();
  beginShape();
  for (int a = 0; a < sy; a++) {
    tinty(a);
    noFill();
    vertex(x*((float)width/sx), toZ(points[x][a], x, a), a*(depth/sy));
  }
  endShape();
}
void tinty(int y) {
  float hue = map(y, 0, sy, 245, 345);
  stroke(color(hue, 100, 80));
  fill(color(hue, 100, 100));
  //stroke(255);
  //fill(255);
}
float toZ(float z, int x, int y) {
  return (z*20)+map(y, 0, sy+10, height/10, (height/4)*3)+(sin((float)(x-y)/20+mult))*20+30;//+curveFunktion(x,y);
}

void setup() {
  size(canvasX, canvasY, P3D);
  depth = height;
  for (int i = 0; i < sx; i++) {
    for (int a = 0; a < sy; a++) {
      points[i][a] = ns2d((float)i/6,(float)a/6);
    }
  }
  colorMode(HSB, 360, 100, 100);
  mult = 0;
}

void draw() {
  background(0);
  for (int a = 0; a < sy; a++) {
    drawRasterH(a);
  }
  for (int i = 0; i < sx; i++) {
    drawRasterV(i);
  }
  mult=mult+0.015;
  //println(frameRate);
}
