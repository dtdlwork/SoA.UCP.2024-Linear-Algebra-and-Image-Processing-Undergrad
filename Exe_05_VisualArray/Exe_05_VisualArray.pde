float[] grayValues;
void setup(){
  size(600,600);
  background(255, 255, 0);
  grayValues = new float[10];
  for(int i=0; i<grayValues.length; i++){
    grayValues[i] = random(255);
  }
}

void draw(){
  int side = 50;
  for(int i=0; i<grayValues.length; i++){
    strokeWeight(3);
    stroke(255, 255, 0);
    fill(grayValues[i]);
    rect(50+i*side,height/2-side/2,side,side);
    fill(255, 255, 0);
    textSize(24);
    textAlign(CENTER,CENTER);
    text(i,50+i*side+side/2,height/2);
  } 
}
