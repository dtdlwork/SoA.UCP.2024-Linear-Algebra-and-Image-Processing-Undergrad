PImage img;
color[] vector;
void setup() {
  size(475, 448);
  background(255, 255, 0);
  img = loadImage("ruffSquare.jpg");
  img.loadPixels();
  vector = new color[img.width*img.height];
  int index=0;
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      vector[index] = img.get(i, j);
      index++;
    }
  }
}

void draw() {
  background(255, 255, 0);
  noStroke();

  int index = 0;
  int move = frameCount;
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      fill(vector[index]);
      rect(i, j, 1, 1);
      index++;
      index = (index+move)%(img.width*img.height);
    }
  }
}
