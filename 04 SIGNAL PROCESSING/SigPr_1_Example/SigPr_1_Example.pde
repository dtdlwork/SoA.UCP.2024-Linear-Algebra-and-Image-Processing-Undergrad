import processing.video.*;
Movie movie;
color mainColor = color(255, 255, 0);
float movRatio;
int widthLim, heightLim;
int margin = 20;
color[][] input;
PImage output;
int posX, posY;
int moveY = 0;

void setup() {
  fullScreen();
  background(mainColor);
  loader();
  posX = margin;
  posY = height/2-(heightLim/2);
}


void loader() {
  movie = new Movie(this, "horses.mp4");
  movie.loop();
  print("Loading video file ");
  while (movie.width==0) {
    print(".");
  }
  println(" DONE");
  movRatio = movie.height/float(movie.width);
  input = new color[movie.width][movie.height];
  widthLim = int((width/2)-1.5*margin);
  heightLim = int(widthLim*movRatio);
  output = createImage(widthLim, heightLim, RGB);
  for (int i=0; i<widthLim; i++) {
    for (int j=0; j<heightLim; j++) {
      input[i][j] = mainColor;
      output.set(i, j, mainColor);
    }
  }
  fill(0);
}

void draw() {
  background(mainColor);
  header();
  output.filter(DILATE);
  output.filter(BLUR);
  image(movie, posX, posY, widthLim, heightLim);
  text("INPUT SIGNAL", margin, posY+heightLim+margin*0.5);
  image(output, width/2+(margin*0.5), posY, widthLim, heightLim);
  text("OUTPUT SIGNAL", width/2+(margin*0.5), posY+heightLim+margin*0.5);
  for (int i=0; i<widthLim; i++) {
    for (int j=0; j<heightLim; j++) {
      input[i][j] = get(posX+i, posY+j);
      int nextY = j+moveY;
      if (brightness(input[i][j])<100)output.set(i, nextY, input[i][j]);
    }
  }
  moveY = (moveY+int(map(cos(radians(frameCount)), -1, 1, 0, 1)*heightLim))%heightLim;
  footer();
}

void header() {
  textAlign(LEFT, TOP);
  textSize(18);
  text("MEDIA PRACTICES II\nLinear Algebra & Image Processing\nSIGNAL PROCESSING I", margin, margin);
}

void footer(){
   textAlign(LEFT, BOTTOM);
   textSize(12);
   text("Diogo Tudela\nSchool of Arts — UCP\nartes.ucp.pt",margin,height-margin);
}



void movieEvent(Movie m) {
  m.read();
}
