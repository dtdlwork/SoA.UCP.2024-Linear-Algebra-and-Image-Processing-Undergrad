PImage img;
float xOff = random(1000);
float yOff = random(1000);
void setup(){
  size(811,1000);
  background(0);
  smooth();
  img = loadImage("ruoy.jpg");
  img.loadPixels();
}

void draw(){
  
  float posX = noise(xOff)*width;
  float posY = noise(yOff)*height;
  xOff+=0.01;
  yOff+=0.01;
  
  color thisPixel = img.get(int(posX),int(posY));
  float diam = saturation(thisPixel); 
  float mapDiam = map(diam,0,255,10,100);
  
  noStroke();
  fill(thisPixel);
  ellipse(posX,posY,mapDiam,mapDiam);
  filter(DILATE);
  filter(BLUR);
  
}
