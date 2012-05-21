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
  
  public PImage crushWebcam(PImage webcam) {
    webcam.loadPixels();
    int len = pixels.length;
    for ( int i = 0; i < webcam.pixels.length ; i++ ) {
      webcam.pixels[i] = webcam.pixels[len - i];
    }
    webcam.updatePixels();
    return webcam;
  }
  
}

