import processing.video.*;
Movie movie;
color mainColor = color(255, 255, 0);
float movRatio;
int widthLim, heightLim;
int margin = 20;
color[] input;
PImage output;
int posX, posY;
int scan = 0;
int print = 0;
int[] data;

void setup() {
  fullScreen();
  background(mainColor);
  loader();
  posX = margin;
  posY = height/2-(heightLim/2);
}


void loader() {
  movie = new Movie(this, "dance.mp4");
  movie.loop();
  print("Loading video file ");
  while (movie.width==0) {
    print(".");
  }
  println(" DONE");

  movRatio = movie.width/float(movie.height);

  heightLim = (height/2);
  widthLim = int(heightLim*movRatio);
  input = new color[heightLim];
  data = new int[input.length];
  output = createImage(width-(widthLim)-3*margin, heightLim, RGB);

  for (int i=0; i<output.width; i++) {
    for (int j=0; j<output.height; j++) {
      output.set(i, j, color(255,255,0));
    }
  }
}

void draw() {
  background(mainColor);


  header();

  image(movie, posX, posY, widthLim, heightLim);
  image(output, margin+widthLim+margin, posY);

  scan=widthLim/2;
  int sampleX = posX+scan;


  noFill();
  beginShape();
  for (int j=0; j<heightLim; j++) {
    int sampleY = posY+j;
    input[j] = get(sampleX, sampleY);
    data[j] = int(brightness(input[j]));
    output.set(print, j, input[j]);
    float vx = margin+widthLim+margin+(j*(output.width/float(heightLim)));
    float vy = posY+heightLim+50-map(data[j],0,255,0,40);
    vertex(vx, vy);
  }
  endShape();
  print=int((print+1)%output.width);





  footer();
}

void header() {
  fill(0);
  textAlign(LEFT, TOP);
  textSize(18);
  text("MEDIA PRACTICES II\nLinear Algebra & Image Processing\nSLITSCAN + WAVEFORM", margin, margin);
}

void footer() {
  fill(0);
  textAlign(LEFT, BOTTOM);
  textSize(12);
  text("Diogo Tudela\nSchool of Arts — UCP\nartes.ucp.pt", margin, height-margin);
}



void movieEvent(Movie m) {
  m.read();
}
