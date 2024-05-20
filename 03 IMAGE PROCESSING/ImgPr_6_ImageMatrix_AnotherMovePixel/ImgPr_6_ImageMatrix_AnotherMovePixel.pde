PImage img;
void setup() {
  size(475, 448);
  background(255, 255, 0);
  img = loadImage("ruffSquare.jpg");
  img.loadPixels();
}

void draw() {
  background(255, 255, 0);
  noStroke();

  int index=0;
    for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      int getI = int(i+frameCount*10+random(10))%(img.width-1);
      int getJ = int(j+frameCount*10+random(10))%(img.height-1);
      fill(img.get(getI, getJ));
      rect(i, j, 1, 1);
      index++;
    }
  }
}
