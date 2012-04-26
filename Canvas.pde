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
  
  int blobWide = fieldX/spacingX;
  int blobHigh = fieldY/spacingY;
  
  Canvas(int tempwide, int temphigh, int tempelevation) {
    wide = tempwide;
    high = temphigh;
    elevation = tempelevation;  //distance below motor horizonal paper begins
  }
  
  public int getBlobWide() {
    return blobWide;
  }
  
  public int getBlobHigh() {
    return blobHigh;
  }
  
  private void stretchCanvas() {
    
  }
  
}
