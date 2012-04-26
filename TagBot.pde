//PImage img;
import processing.video.*;
Capture myCapture;
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

int[] greyValues = new int[fieldSize];

int mainFlop = 0;  
Scanner scanner;
Printer printer;
void setup() {
  //img = loadImage("zelda.png");
  size(wig, hig);
  //colorMode(HSB);
  rectMode(CORNERS);
  ellipseMode(CENTER);
  myCapture = new Capture(this, width, height, 30);
  scanner = new Scanner();
  printer = new Printer();
}


void draw() {
  
  // Primary states of the application:
  // 0 is webcam capture
  // 1 freezes capture and analyzes the frame
  // 2 displays the capture grid
  
  switch(mainFlop){
    
    // freeze capture and put the contents of the frame into Scanner's greyValues[];
    case 1:
      //updatePixels();
      scanner.run();
      break;
      
    // display the capture grid
    case 2:
      scanner.displayGrid();
      break;
      
    // starting state for application and fallback
    // Imports webcam capture and pushes contrast to extremes
    case 3:
      printer.displayGrid();
      break;
    default:
      background(0);
      // draw capture frame to screen and load the pixels into pixels[]
      image(myCapture, 0, 0);
      loadPixels();
      
      
      for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
          
          
          /*
          float bl =  blue(get(i,j));
          float rd =   red(get(i,j));
          float gr = green(get(i,j));
          float avg = (bl+rd+gr)/3;
          */
          
          
          // get the individual color values for each pixel being brought in
          float avg = (red(get(i,j))+green(get(i,j))+blue(get(i,j)))/3;
          avg = map (avg, 0, 255, -150, 700);
          
          
          //commented out to save computation
          /*
          rd = map(rd, 0, 255, -100, 900);
          bl = map(bl, 0, 255, -100, 900);
          gr = map(gr, 0, 255, -100, 900);
          float inv = map (avg, 0, 100, 100, 0);
          */
          
          
          pixels[width-i-1+j*width] = color(avg, avg, avg);
          
          
          // Convert image into stripes. No real purpose, just playing around
          /*if (i < width/4) {
            pixels[width-i-1+j*width] = color(avg, avg, avg);
          }  else if (i >= width/4 && i < width/2) {
            pixels[width-i-1+j*width] = color(rd, 0, rd); 
          } else if (i >= width/2 && i < 3*width/4) {
            pixels[width-i-1+j*width] = color(gr, gr, 0); 
          } else {
            pixels[width-i-1+j*width] = color(0, bl, bl); 
          } //*/
          
          
        }
      }
      updatePixels();
      break;
  }
  
  
  
}

// Get in the webcam stream each run.
void captureEvent(Capture myCapture) {
  myCapture.read();
}


// Space key is the state changer between the capture mode and review mode
void keyPressed() {
  if (key == ' ') {
    mainFlop++;
    if (mainFlop > 3) {
      mainFlop =0;
    }
    /*
    if (mainFlop == 0 ) {
      mainFlop = 1;
    } else {
      mainFlop = 2; 
    }*/
  }
}



