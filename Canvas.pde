class Canvas {
  
  // These are in centimeters
  // Approximately 2' by 3'
  int wide = 60;
  int high = 90;
  
  int elevation = 30;
  
  int spacingX = 4;
  int spacingY = 5;
  
  int marginXmin = 4;
  int marginYmin = 5;
  
  int fieldX = wide-marginXmin*2;
  int fieldY = high-marginYmin*2;
  
  int dotsWide = fieldX/spacingX;
  int dotsHigh = fieldY/spacingY;
  
  String orientation = "portrait";
  
  // Stuff. I don't know. It's declarations.
  Canvas ( int tempwide, int temphigh, int tempelevation ) {
    wide = tempwide;
    high = temphigh;
    elevation = tempelevation;  //distance below motor horizonal paper begins
  }
  
  public int getDotsWide() {
    return dotsWide;
  }
  
  public int getDotsHigh() {
    return dotsHigh;
  }
  
  private void stretchCanvas() {
    
  }
  
  public String getOrientation() {
    
    return orientation;
  }
  
  public boolean setOrientation( String newOrientation) {
    orientation = newOrientation;
    return true;
  }
  
  public boolean flipOrientation() {
    if (orientation == "landscape") {
      orientation = "portrait";
    } else {
      orientation = "landscape";
    }
    return true;
  }
  
}
