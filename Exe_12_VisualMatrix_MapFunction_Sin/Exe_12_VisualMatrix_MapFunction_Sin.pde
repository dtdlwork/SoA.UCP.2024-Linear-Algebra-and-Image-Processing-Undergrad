float[][] grayValues;

void setup() {
  size(600, 600);
  background(255, 255, 0);
  grayValues = new float[50][50];  
}

void draw() {
  int side = 10;
  float freq = map(mouseX,0,width,10,100);
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = noise(i*0.01,j*0.01,frameCount*0.005)*255;
      float sinVal = sin(radians(map(grayValues[i][j],0,255,0,360))*freq);
      float mapSin = map(sinVal,-1,1,0,255);
      strokeWeight(1);
      stroke(255, 255, 0);
      fill(mapSin);
      rect(50+i*side, 50+j*side, side, side);
    }
  }
}
