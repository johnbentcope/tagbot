/*** IMPORTE LAS BIBLIOTECAS ***/
import processing.video.*;

/*** INSTANTIALIZINATE SOME OBJECTS ***/
PImage imgBase;
PImage imgScanned;
Capture webcam;
PreviewBox previewBox;
Canvas canvas;
Robot robot;
Scanner scanner;

int prevMargin = 50; //makes setting margins simpler



/*** Global vars... Probably too many of these
 * TODO: trim global vars and objectify the code. ***/


void setup() {
  size(640, 480);
  rectMode(CENTER);
  noFill(); 
  frameRate(15);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {

    webcam = new Capture(this, 640, 480, cameras[0]);

    webcam.start();
  }      

  imgBase = new PImage(width, height);

  // PreviewBox ( int xMin, int yMin, int xMax, int yMax )
  previewBox = new PreviewBox(prevMargin, prevMargin, 
  width-prevMargin, height-prevMargin);

  // Canvas ( int tempwide, int temphigh, int tempelevation )
  canvas = new Canvas(60, 90, 30);

  // Robot ( int motorSpan, in numColors )
  robot = new Robot(500, 1);

  scanner = new Scanner();
}


void draw() {
  background(0);
  if (webcam.available() == true) {
    webcam.read();
    //image(webcam, 0, 0);
    image(scanner.crushWebcam(webcam), 0, 0);
  }
  previewBox.makeIt(canvas.getOrientation());
}

void keyPressed() {
  switch (key) {
  case 's':
    canvas.flipsOrientation() ;
    break;
  }
  
}

