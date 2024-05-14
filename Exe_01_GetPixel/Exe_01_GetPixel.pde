PImage img;

void setup(){
  size(811,1000);
  background(0);
  smooth();
  img = loadImage("ruoy.jpg");
}

void draw(){
  image(img,0,0);
  
  stroke(255);
  int opening = 20;

  line(mouseX,0,mouseX,mouseY-opening);
  line(mouseX,height,mouseX,mouseY+opening);
  line(0,mouseY,mouseX-opening,mouseY);
  line(width,mouseY,mouseX+opening,mouseY);
  
  color thisPixel = get(mouseX,mouseY);
  fill(thisPixel);
  rect(mouseX+opening,mouseY+opening,opening*2,opening*2);
  
  fill(255);
  textAlign(LEFT,TOP);
  text("R: "+int(red(thisPixel))+"\nG: "+int(green(thisPixel))+"\nB: "+int(blue(thisPixel)),mouseX+3.5*opening,mouseY+opening);
}
