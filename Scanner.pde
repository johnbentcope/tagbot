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
    int len = webcam.pixels.length;

    webcam.updatePixels();
    return webcam;
  }
  
}

