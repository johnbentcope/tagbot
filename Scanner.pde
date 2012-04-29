class Scanner {
  


  
  float xPos = xMin;
  float yPos = yMin;
  int flip = 0;
  
  Scanner() { 
  }
  
  boolean update() {
    
    // if the scanner is moving left to right
    if (flip == 0) {
      
      // test if the next step will overshoot the range
      if (xPos + xStep >= xMax+(xStep/2)) {
        flip = 1;
        yPos += yStep;  
      } else {
        xPos += xStep;
      }
      
    // if the scanner is moving right to left 
    } else {
      if (xPos - xStep < xMin) {
        flip = 0;
        yPos += xStep;
      } else {
        xPos -= xStep;
      }
    }
    
    // Spit out false when it hits max
    if (yPos > yMax ) {
      //noLoop();
      return false;
    } else {
      return true;
    }
    
  }
  
  
  void render() {
    
    // plot a dot on the screen with each pass
    fill(get(floor(xPos), floor(yPos)));
    noStroke();
    ellipse(xPos, yPos, 2, diam);
    
    // This part os for the bounding box
    stroke(255);
    noFill();
    strokeWeight(5);
    //rect(xMin, yMin, xMax, yMax);
    
  }
  
  void setGrid() {
    loadPixels();
    int inc = 0;
    for ( int i = yMin; i < yMax; i += yStep ) {
      for ( int j = xMin; j < xMax; j += xStep ) {
        color splat = pixels[ i*width + j ];
        println(hue(splat));
        int splatAvg = floor((red(splat)+green(splat)+blue(splat))/3);
        if (splatAvg > 150) {
          grid[i][j].setColor(grid[i][j], color(255));
        } else {  
          grid[i][j].setColor(grid[i][j], color(0));
        }
        pixels[ i*width + j ] = greyValues[inc];
        inc++;
      }
    }
    updatePixels();
  }
  
  void displayGrid() {
    background(255);
    int inc = 0;
    for ( int i = yMin; i < yMax; i += yStep ) {
      for ( int j = xMin; j < xMax; j += xStep ) {
        fill(greyValues[inc]);
        noStroke();
        if (red(greyValues[inc]) == 0) {
          ellipse(j, i, 6, 12); 
        }
        inc++;
      }
    }
    
    println(grid.length);
    /*
    int derp = (ceil((yMax-yMin)/yStep))*(ceil((xMax-xMin)/xStep));
    println("derp " + derp);
    println("greyValues " + greyValues.length);
    println("inc " + inc);
    println("first color " + binary(greyValues[0]));//*/

  }
  
  void run() {
    

  }
}
