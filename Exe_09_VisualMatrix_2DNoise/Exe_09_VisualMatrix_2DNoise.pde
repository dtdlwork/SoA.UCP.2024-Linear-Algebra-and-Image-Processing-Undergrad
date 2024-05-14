float[][] grayValues;

void setup() {
  size(600, 600);
  background(255, 255, 0);
  grayValues = new float[50][50];
  
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = noise(i*0.1,j*0.1)*255;
    }
  }
  
}

void draw() {
  int side = 10;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      strokeWeight(1);
      stroke(255, 255, 0);
      fill(grayValues[i][j]);
      rect(50+i*side, 50+j*side, side, side);
    }
  }
}
