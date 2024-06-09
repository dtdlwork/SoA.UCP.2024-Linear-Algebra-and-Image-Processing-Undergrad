import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pureData;
PImage img;

void setup() {
  size(811,1000);
  background(0);
  smooth();
  img = loadImage("ruoy.jpg");
  oscP5 = new OscP5(this, 12000);
  pureData = new NetAddress("127.0.0.1", 32000);
}


void draw() {
  image(img,0,0);
  stroke(255);
  int opening = 20;
  line(mouseX,0,mouseX,mouseY-opening);
  line(mouseX,height,mouseX,mouseY+opening);
  line(0,mouseY,mouseX-opening,mouseY);
  line(width,mouseY,mouseX+opening,mouseY);
  color thisPixel = get(mouseX,mouseY);
  fill(brightness(thisPixel));
  rect(mouseX+opening,mouseY+opening,opening*2,opening*2);
  fill(255);
  textAlign(LEFT,TOP);
  text("Brightness/Frequency: "+brightness(thisPixel)+"Hz",mouseX+3.5*opening,mouseY+opening);
  com(brightness(thisPixel));
}

void com(float input) {
  OscMessage myOscMessage = new OscMessage("/"+input);
  oscP5.send(myOscMessage, pureData);
}
