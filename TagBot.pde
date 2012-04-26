/*** IMPORTE LAS BIBLIOTECAS ***/
//PImage img; 
import processing.video.*;

/*** INSTANTIALIZINATE SOME OBJECTS ***/
PreviewBox previewBox;
Canvas canvas;

int prevMargin = 50; //makes setting margins simpler

int motorSpan = 500; // width between motors in centimeters

/*** Global vars... Probably too many of these
 * TODO: trim global vars and objectify the code. ***/


void setup() {
  size(600, 600);
  rectMode(CORNERS);
  noFill();
  
  // PreviewBox ( int xMin, int yMin, int xMax, int yMax);
  previewBox = new PreviewBox(prevMargin, prevMargin,
                              width-prevMargin, height-prevMargin);
  canvas = new Canvas(60, 90, 30);
  
}


void draw() {
  previewBox.makeIt();
  
}




