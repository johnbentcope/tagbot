/*** IMPORTE LAS BIBLIOTECAS ***/
//PImage img; 
import processing.video.*;

/*** INSTANTIALIZINATE SOME OBJECTS ***/
PreviewBox previewBox;

/*** Global vars... Probably too many of these
 * TODO: trim global vars and objectify the code. ***/


void setup() {
  size(600, 600);
  
  
  // PreviewBox ( int xMin, int yMin, int xMax, int yMax);
  previewBox = new PreviewBox(30, 30, width-30, height-30);
  
}


void draw() {
 
  
  
}




