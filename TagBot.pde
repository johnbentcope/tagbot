/*** IMPORTE LAS BIBLIOTECAS ***/
import processing.video.*;

/*** INSTANTIALIZINATE SOME OBJECTS ***/
PImage imgBase;
PImage imgScanned;
PFont creepster;
PFont dillenia;
Capture webcam;
PreviewBox previewBox;
Canvas canvas;
Robot robot;
Scanner scanner;
StateMachine stateMachine;


int prevMargin = 50; //makes setting margins simpler



/*** Global vars... Probably too many of these
 * TODO: trim global vars and objectify the code. ***/


void setup() {
  size(640, 480);
  rectMode(CENTER);
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
  
  stateMachine = new StateMachine();
  dillenia  = loadFont("DilleniaUPCBold-32.vlw");
  creepster = loadFont("Creepster-Regular-48.vlw");

}


void draw() {
  background(0);
  if (webcam.available() == true) {
    webcam.read();
    //image(webcam, 0, 0);
    imgBase = scanner.getWebcam(webcam);
  }
  
  // 0 is straight webcam
  // 1 is crushed webcam preview
  // 2 is proof of design
  
  switch (stateMachine.globalState()) {
    case 0:
      image(imgBase, 0, 0);
      previewBox.makeIt(canvas.getOrientation());
      break;
    case 1:
      image(scanner.crushWebcam(imgBase, previewBox),0 ,0 );
      previewBox.makeIt(canvas.getOrientation());
      break;
    case 2:
      break;
  }
  stateMachine.makeLogo();
  stateMachine.displayState();
}

void keyPressed() {
  switch (key) {
    case 's' :
      canvas.flipOrientation();
      break;
    case 'a' :
      stateMachine.aButton();
      break;
    case 'd' :
      stateMachine.dButton();
      break;
  }
  
  
}

