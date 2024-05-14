PImage img;

void setup(){
  size(811,1000);
  background(0);
  smooth();
  img = loadImage("ruoy.jpg");
  img.loadPixels();
}

void draw(){
  color thisPixel = img.get(mouseX,mouseY);
  float diam = saturation(thisPixel); 
  float mapDiam = map(diam,0,255,10,100);
  noStroke();
  fill(thisPixel);
  ellipse(mouseX,mouseY,mapDiam,mapDiam);
  
}
