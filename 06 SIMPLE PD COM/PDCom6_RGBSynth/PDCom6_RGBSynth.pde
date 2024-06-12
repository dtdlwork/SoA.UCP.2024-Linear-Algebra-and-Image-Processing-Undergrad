import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pureData;
PImage img;
float[][] grayValues;
int reader1, reader2;
int xSelect = 200;
float[]r, g, b;
int reader = 0;


void setup() {
  oscP5 = new OscP5(this, 12000);
  pureData = new NetAddress("127.0.0.1", 32000);
  img = loadImage("ruoy.jpg");
  img.loadPixels();
  size(1011, 1000); //811+200
  background(0);
  r = new float[img.height];
  g = new float[img.height];
  b = new float[img.height];
}

void draw() {
  background(0);
  noStroke();
  image(img, 0, 0);

  xSelect = int(map(sin(radians(frameCount)),-1,1,0,img.width-1));
  if (xSelect>=img.width)xSelect = img.width-1;
  for (int j=0; j<img.height; j++) {
    r[j] = red(img.get(xSelect, j)); 
    g[j] = green(img.get(xSelect, j)); 
    b[j] = blue(img.get(xSelect, j));
  }

  stroke(255);
  line(xSelect, 0, xSelect, height);
  reader=int(map(sin(radians(frameCount)),-1,1,0,img.height-1));
  line(img.width, reader, width, reader);


  //PLOT GRAPH
  for (int y=0; y<img.height; y++) {
    float rX = map(r[y], 0, 255, 811, 1011);
    float gX = map(g[y], 0, 255, 811, 1011);
    float bX = map(b[y], 0, 255, 811, 1011);
    stroke(255, 0, 0);
    point(rX, y);
    stroke(0, 255, 0);
    point(gX, y);
    stroke(0, 0, 255);
    point(bX, y);
  }

  com(r[reader], g[reader]*2, b[reader]*3);
}

void com(float input1, float input2, float input3) {
  OscMessage myOscMessage = new OscMessage("/rgb");
  myOscMessage.add(input1);
  myOscMessage.add(input2);
  myOscMessage.add(input3);
  oscP5.send(myOscMessage, pureData);
}
