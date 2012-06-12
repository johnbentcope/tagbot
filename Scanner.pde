class Scanner {



  Scanner() {
  }

  private boolean update() {
    return true;
  }
  
  public PImage tinyMake( PImage imgScanned , PImage imgTiny , Canvas canvas ) {
    imgScanned.loadPixels();
    imgTiny.loadPixels();
    
    int dotsWide = canvas.dotsWide;
    int dotsHigh = canvas.dotsHigh;
    imgTiny.width = dotsWide;
    imgTiny.height = dotsHigh;
    int imgWidth = imgScanned.width;
    int imgHeight = imgScanned.height;
    int horiSpacing = (imgWidth / dotsWide);
    int vertSpacing = (imgHeight / dotsHigh);
    //println("H = " + horiSpacing + " - V = " + vertSpacing);
    int wideTest= dotsWide-1;
    int highTest = dotsHigh-1;
    //println(wideTest + "*" +  + imgWidth + "+" + highTest + "*" + vertSpacing);
    
    int loopWide = dotsWide-1;
    int loopHigh = dotsHigh-1;
    
    int tested = (loopHigh*imgWidth)+(loopHigh*horiSpacing)+(loopWide*vertSpacing);
    //println("TESTED = " + tested);
    for ( int i = 0 ; i < dotsWide ; i++ ) {
      for ( int j = 0 ; j < dotsHigh ; j++ ) {
        imgTiny.pixels[j*dotsWide+i] = imgScanned.pixels[((j+1)*imgWidth*horiSpacing)+((i+1)*vertSpacing)];
        
        //imgScanned.pixels[((j+1)*imgWidth*horiSpacing)+((i+1)*vertSpacing)] = color(0, 255, 0);
      }
    }
    imgTiny.updatePixels();
    imgScanned.updatePixels();
    //println(imgScanned.width + " and " + imgScanned.height);
    //println(imgScanned.pixels.length);
    
    //println(imgTiny.width + " and " + imgTiny.height);
    //println(imgTiny.pixels.length);
    return imgTiny;
  }
  
  public boolean blobMake(PImage imgTiny, PreviewBox previewBox, Canvas canvas) {
    
    ellipseMode(CORNER);
    int xMin = previewBox.xMin;
    int yMin = previewBox.yMin;
    int xMax = previewBox.xMax;
    int yMax = previewBox.yMax;
    int dotsWide = canvas.dotsWide;
    int dotsHigh = canvas.dotsHigh;
    int horiSpacing = ((xMax-xMin) / dotsWide);
    int vertSpacing = ((yMax-yMin) / dotsHigh);
    //println(imgTiny.height);
    imgTiny.loadPixels();
    for ( int i = 0 ; i < imgTiny.height ; i++) {
      for ( int j = 0 ; j < imgTiny.width ; j++ ) {
        noStroke();
        color temp = imgTiny.pixels[i*(imgTiny.width)+j];
        if ( ((red(temp) + green(temp) + blue(temp))/3) < 250 ) {
          fill(temp);
        } else {
          noFill();
        }
        ellipse((j+1)*horiSpacing+xMin, (i+1)*vertSpacing+yMin, 15, 15);
      }
    }
    
    
    return true;
  }
  
  public PImage getWebcam(PImage webcam) {
    return webcam;
  }
  
  public PImage crushWebcam(PImage webcam, PreviewBox previewBox, String orientation) {
    webcam.loadPixels();
    int len = webcam.pixels.length;
    int cutoff = floor(mouseY);
    cutoff = floor( map(cutoff, 0, height, 0, 255));
    int lowCutoff = floor(mouseX);
    lowCutoff = floor( map(lowCutoff, 0, height, 0, 255));
    for ( int i = 0; i < len ; i++ ) {
      int avg = floor((red(webcam.pixels[i]) + green(webcam.pixels[i]) + blue(webcam.pixels[i]))/3);
      
      if (avg > cutoff) {
        webcam.pixels[i] = color(255);
      } else if (avg < lowCutoff) {
        webcam.pixels[i] = color(0);
      } else {
        webcam.pixels[i] = color(#FF0088);
      }
    }
    
    webcam.updatePixels();
    if (orientation == "portrait") {
      webcam = webcam.get(previewBox.xMin(), previewBox.yMin(), previewBox.wide, previewBox.high);
    } else {
      webcam = webcam.get(previewBox.xMin(), previewBox.yMin(), previewBox.high, previewBox.wide);
    }
    return webcam;
    
  }
  
}

