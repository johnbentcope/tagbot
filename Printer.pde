class Printer {
  
  
  
  Printer() {
    
  }
  
  void displayGrid() {
    background(255);
    int inc = 0;
    int colInc = 0;
    int xNumSteps = (yMax - yMin)/xStep;
    int yNumSteps = (xMax - xMin)/yStep;
    for ( int i = 0; i < yNumSteps-1; i++ ) {
      for ( int j = 0; j < xNumSteps-1; j++ ) {
        fill(red(greyValues[inc]), 255, 255);
        noStroke();
        if (j%2 == 0) {
          if (red(greyValues[inc]) == 0) {
            ellipse(i*xStep, j, 6, 12); 
          }
        } else {
          //println(inc);
          if (red(greyValues[inc]) == 0) {
            fill(255, 0, 255);
            ellipse(width-i*xStep, j*xStep, 6, 12);
          } 
        }
        inc++;
      }
    }
    /*
    int derp = (ceil((yMax-yMin)/yStep))*(ceil((xMax-xMin)/xStep));
    println("derp " + derp);
    println("greyValues " + greyValues.length);
    println("inc " + inc);
    println("first color " + binary(greyValues[0]));*/
    //println("w00000000000000000000000000000000000000000000000000000000000000000000");
  }
  
  void run(int[]  greyValues[]){
    for (int i = 0; i<80; i++ ) {
      
    }
  }
  
}
