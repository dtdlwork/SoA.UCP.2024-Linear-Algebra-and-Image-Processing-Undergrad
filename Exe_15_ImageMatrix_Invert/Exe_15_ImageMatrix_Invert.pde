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
      color thisPixel = img.get(i, j);
      if (brightness(thisPixel)>map(mouseX,0,width,0,255)) {
        fill(thisPixel);
      } else {
        fill(255-red(thisPixel),255-green(thisPixel),255-blue(thisPixel));
      }
      rect(i, j, 1, 1);
    }
  }
}
