import processing.video.*;
Movie file;

void setup() {
  size(360, 640);
  background(0);
  smooth();
  file = new Movie(this, "dance.mp4");
  file.loop();
  
}

void draw() { 
  image(file,0,0);
}














void movieEvent(Movie m) {
  m.read();
}
