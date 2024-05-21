import processing.video.*;
Movie file;
color[] mid;

void setup() {
  size(1440, 640);
  background(0);
  smooth();
  mid = new color[640];
  file = new Movie(this, "dance.mp4");
  file.loop();
}

void draw() {
  image(file, 0, 0);
  
  int posX = file.width/2;
  float scanMove = frameCount%(3*file.width);
  float scanX = file.width+scanMove;
  noStroke();
  for(int i=0; i<mid.length; i++){
    mid[i] = get(posX,i);
    fill(mid[i]);
    rect(scanX,i,1,1);
  }


}














void movieEvent(Movie m) {
  m.read();
}
