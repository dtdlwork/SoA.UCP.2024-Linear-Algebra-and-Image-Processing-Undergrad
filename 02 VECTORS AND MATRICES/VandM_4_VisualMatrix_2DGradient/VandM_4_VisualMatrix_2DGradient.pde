float[][] grayValues;

void setup() {
  size(600, 600);
  background(255, 255, 0);
  grayValues = new float[10][10];
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = i*(128/grayValues.length) + j*(128/grayValues[i].length);
    }
  }
}

void draw() {
  int side = 50;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      strokeWeight(3);
      stroke(255, 255, 0);
      fill(grayValues[i][j]);
      rect(50+i*side, 50+j*side, side, side);
      fill(255, 255, 0);
      textSize(14);
      textAlign(CENTER, CENTER);
      text(i+","+j, 50+i*side+side/2, 50+j*side+side/2);
    }
  }
}
