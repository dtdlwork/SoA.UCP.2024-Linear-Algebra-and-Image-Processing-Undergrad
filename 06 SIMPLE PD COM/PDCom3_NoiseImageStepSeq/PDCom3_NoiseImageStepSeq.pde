import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pureData;

float[][] grayValues;
int t = 0;
float send = 0;
int tempo = 1;
float offSet = 0.1;

void setup() {
  oscP5 = new OscP5(this, 12000);
  pureData = new NetAddress("127.0.0.1", 32000);
  size(600, 600);
  background(0, 255, 75);
  grayValues = new float[100][100];
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = noise(i*offSet, j*offSet, 0)*255;
    }
  }
}

void draw() {

  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = noise(i*offSet, j*offSet, frameCount*0.1)*255;
    }
  }


  int side = 5;
  int index = 0;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      strokeWeight(1);
      stroke(0, 255, 75);
      fill(grayValues[i][j]);
      if (t==index) {
        send = grayValues[i][j];
        fill(0, 0, 255);
      }
      rect(50+i*side, 50+j*side, side, side);
      index++;
    }
  }

  if (frameCount%tempo==0)t = (t+1)%(index-1);
  com(send);
}

void com(float input) {
  OscMessage myOscMessage = new OscMessage("/"+input);
  oscP5.send(myOscMessage, pureData);
}
