class Scanner {



  Scanner() {
  }

  private boolean update() {
    return true;
  }


  public void render() {

  } 

  public PImage getWebcam(PImage webcam) {
    return webcam;
  }
  
  public PImage crushWebcam(PImage webcam, PreviewBox previewBox) {
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
    return webcam;
  }
  
}

