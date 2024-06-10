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
}

void draw() {
  
  int nr = 0;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = map(sin(radians(nr*9)+(frameCount*(mouseX*0.01))), -1, 1, 0, 255);
      nr++;
    }
  }


  int side = 6;
  int index = 0;
  noStroke();
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      fill(grayValues[i][j]);
      if (t==index) {
        send = map(grayValues[i][j],0,255,100,200);
        fill(0, 0, 255);
      }
      rect(i*side, j*side, side, side);
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
