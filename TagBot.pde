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
<<<<<<< HEAD
=======
int wig= 600;
int hig = 600;
int step = 20;
int diam = 12;

int xStep = 2;
int yStep = 10;
int yMin = step;
int xMin = yMin;

int yMax = hig-step;
int xMax = wig-step;

int xSteps = (xMax-xMin)/xStep;
int ySteps = (yMax-yMin)/yStep;


int fieldSize = ((yMax-yMin)/yStep)*((xMax-xMin)/xStep);
>>>>>>> 851c63a07e56dc08225ef2ab16ce37e2cf94de3f


void setup() {
  size(600, 600);
  rectMode(1);
  noFill();
  
  webcam = new Capture(this, width, height, 30);
  
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
  image(scanner.getWebcam(webcam), 0, 0);
  
  previewBox.makeIt();
  
  
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}



