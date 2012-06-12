/*** IMPORTE LAS BIBLIOTECAS ***/
import processing.video.*;

/*** INSTANTIALIZINATE SOME OBJECTS ***/
PImage imgBase;
PImage imgScanned;
PImage imgTiny;
PFont creepster;
PFont dillenia;
Capture webcam;
PreviewBox previewBox;
Canvas canvas;
Encoder encoder;
Robot robot;
Scanner scanner;
StateMachine stateMachine;


int prevMargin = 10; //makes setting margins simpler


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
  imgScanned = new PImage(width, height);

  
  // PreviewBox ( int xMin, int yMin, int xMax, int yMax )
  previewBox = new PreviewBox(prevMargin, prevMargin, 
  width-prevMargin, height-prevMargin);


  // Canvas ( int tempwide, int temphigh, int tempelevation )
  canvas = new Canvas();

  
  imgTiny = new PImage(canvas.dotsWide, canvas.dotsHigh);

  // Robot ( int motorSpan, in numColors )
  robot = new Robot(500, 1);

  scanner = new Scanner();
  
  encoder = new Encoder();
  
  stateMachine = new StateMachine();
  
  
  dillenia  = loadFont("DilleniaUPCBold-27.vlw");
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
      //previewBox.makeIt("portrait");
      break;
    case 1:
      imgScanned = scanner.crushWebcam(imgBase, previewBox, canvas.getOrientation());
      image( imgScanned, previewBox.xMin() , previewBox.yMin() );
      //image(scanner.crushWebcam(imgBase, previewBox), 173, 20);
      previewBox.makeIt(canvas.getOrientation());
      //previewBox.makeIt("portrait");
      break;
    case 2:
      background(255);
      image( imgScanned, previewBox.xMin() , previewBox.yMin() );
      imgTiny = scanner.tinyMake( imgScanned , imgTiny, canvas );
      //scanner.blobShow(scanner.crushWebcam(imgBase, previewBox));
      break;     
    case 3:
      background(255);
      image(imgTiny, 150, 200);
      scanner.blobMake(imgTiny, previewBox, canvas);
      break;
    case 4:
      encoder.gCodeify(imgTiny);
      //exit;
      break;
  }
  
  stateMachine.makeLogo();
  stateMachine.displayState();
  stateMachine.helpText();
  
}

void keyPressed() {
  switch (key) {
    case 's' :
      stateMachine.sButton(canvas);
      break;
    case 'a' :
      stateMachine.aButton();
      break;
    case 'd' :
      stateMachine.dButton();
      break;
    case 'c' :
      stateMachine.cButton();
      break;
    case 'g' :
      stateMachine.gButton();
      break;
  }
  
  
}

