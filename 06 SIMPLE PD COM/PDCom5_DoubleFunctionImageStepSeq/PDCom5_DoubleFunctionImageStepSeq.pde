import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pureData;

float[][] grayValues;
int reader1, reader2;


float send1, send2 =0;
int tempo1 = 3;
int tempo2 = 4;
float offSet = 0.1;

void setup() {
  oscP5 = new OscP5(this, 12000);
  pureData = new NetAddress("127.0.0.1", 32000);
  size(600, 600);
  background(0, 255, 75);
  grayValues = new float[100][100];
  reader1 = int(random(100*100))-1;
  reader2 = int(random(100*100))-1;
}

void draw() {

  int nr = 0;
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      grayValues[i][j] = map(sin(radians(nr*frameCount*i*0.001)+(frameCount*j*0.001)), -1, 1, 0, 255);
      nr++;
    }
  }


  int side = 6;
  int index = 0;
  stroke(255,64);
  for (int i=0; i<grayValues.length; i++) {
    for (int j=0; j<grayValues[i].length; j++) {
      fill(0, grayValues[i][j], 0);
      if (reader1==index) {
        send1 = map(grayValues[i][j], 0, 255, 0, 300);
        fill(255);
      }

      if (reader2==index) {
        send2 = map(grayValues[i][j], 0, 255, 300, 600);
        fill(255);
      }

      rect(i*side, j*side, side, side);
      index++;
    }
  }

  reader1 = (reader1+tempo1)%(index-1);
  reader2 = (reader2+tempo2)%(index-1);

  com(send1, send2);
}

void com(float input1, float input2) {
  OscMessage myOscMessage = new OscMessage("/readers");
  myOscMessage.add(input1);
  myOscMessage.add(input2);
  oscP5.send(myOscMessage, pureData);
}
