PImage img;

void setup() {
  size(800, 448);
  background(255, 255, 0);
  img = loadImage("ruffSmall.jpg");
  img.loadPixels();
}

void draw() {
  background(255, 255, 0);
  noStroke();
  float freq = map(mouseX,0,width,0,20);
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      color thisPixel = img.get(i, j);
      float bri = brightness(thisPixel);
      float sinVal = sin(radians(map(bri,0,255,0,360)*freq)+frameCount);
      float mapSin = map(sinVal,-1,1,0,255);
      fill(mapSin);
      rect(i, j, 1, 1);
    }
  }
}
