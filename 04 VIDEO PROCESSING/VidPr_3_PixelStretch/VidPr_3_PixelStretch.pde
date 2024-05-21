import processing.video.*;
Movie file;
color[] mid;

void setup() {
  size(720, 640);
  background(0);
  smooth();
  mid = new color[640];
  file = new Movie(this, "dance.mp4");
  file.loop();
}

void draw() {
  image(file, 0, 0);
  image(file, width/2, 0);
  int posX = int(map(mouseX,0,width,0,file.width-1));
  for(int i=0; i<mid.length; i++){
    mid[i] = get(posX,i);
    stroke(mid[i]);
    line(posX,i,posX+file.width,i);
  }
  //stroke(255);
  //line(posX,0,posX,height);
}














void movieEvent(Movie m) {
  m.read();
}
