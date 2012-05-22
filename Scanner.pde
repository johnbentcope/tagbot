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
    for ( int i = 0; i < len ; i++ ) {
      webcam.pixels[i] = color(green(webcam.pixels[i]), blue(webcam.pixels[i]), red(webcam.pixels[i]));
    }
    webcam.updatePixels();
    return webcam;
  }
  
}

