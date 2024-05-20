float[][] R,G,B;

void setup() {
  size(600, 600);
  background(255, 255, 0);
  R = new float[50][50];
  G = new float[50][50];
  B = new float[50][50];
}

void draw() {
  int side = 10;
  for (int i=0; i<50; i++) {
    for (int j=0; j<50; j++) {
      R[i][j] = noise(i*0.1,j*0.1,frameCount*0.05)*255;
      G[i][j] = noise(100+i*0.1,100+j*0.1,frameCount*0.05)*255;
      B[i][j] = noise(200+i*0.1,200+j*0.1,frameCount*0.05)*255;
      stroke(255, 255, 0);
      fill(R[i][j],G[i][j],B[i][j]);
      rect(50+i*side, 50+j*side, side, side);
    }
  }
}
