PImage img;

void setup() {
  size(1170, 655);
  background(255, 255, 0);
  img = loadImage("ruff.jpg");
  img.loadPixels();
}

void draw() {
  background(255, 255, 0);
  noStroke();
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      fill(img.get(i,j));
      rect(i,j,1,1);
    }
  }
}
