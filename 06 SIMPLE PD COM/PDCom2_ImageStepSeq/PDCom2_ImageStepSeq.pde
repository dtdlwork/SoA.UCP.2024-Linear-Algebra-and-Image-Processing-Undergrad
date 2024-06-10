import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pureData;

float[][] grayValues;
int t = 0;
float send = 0;
int tempo = 10;

void setup() {
  oscP5 = new OscP5(this, 12000);
  pureData = new NetAddress("127.0.0.1", 32000);
  size(600, 600);
  background(0, 255, 75);
  grayValues = new float[10][10];
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = random(255);
    }
  }
}

void draw() {
  int side = 50;
  int index = 0;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      strokeWeight(3);
      stroke(0, 255, 75);
      fill(grayValues[i][j]);
      if (t==index) {
        send = grayValues[i][j];
        fill(0, 0, 255);
      }
      rect(50+i*side, 50+j*side, side, side);
      fill(0, 255, 75);
      textSize(14);
      textAlign(CENTER, CENTER);
      text(index, 50+i*side+side/2, 50+j*side+side/2);
      index++;
    }
  }

  if (frameCount%tempo==0)t = (t+1)%(index-1);
  com(send);
}

void keyPressed() {
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = random(255);
    }
  }
}

void com(float input) {
  OscMessage myOscMessage = new OscMessage("/"+input);
  oscP5.send(myOscMessage, pureData);
}
