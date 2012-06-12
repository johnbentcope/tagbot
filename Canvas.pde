class Canvas {
  
  // These are in inches
  // Approximately 2' by 3'
  int shortSide = 24;
  int longSide = 36;
  
  int wideInches = shortSide;
  int highInches = longSide;
  
  int spacingX = 4;
  int spacingY = 5;
  
  int marginXmin = 2;
  int marginYmin = 3;
  
  int fieldX = wideInches-marginXmin*2;
  int fieldY = highInches-marginYmin*2;
  
  int dotsShort = 20;
  int dotsLong = 30;
  
  int dotsWide = dotsShort;
  int dotsHigh = dotsLong;
  
  String orientation = "portrait";
  
  // Stuff. I don't know. It's declarations.
  Canvas () {
  }
  
  public String getOrientation() {
    return "portrait";
    //return orientation;
  }
  
  public boolean setOrientation( String newOrientation) {
    //orientation = newOrientation;
    return true;
  }
  
  public boolean flipOrientation() {
    /*if (orientation == "landscape") {
      orientation = "portrait";
      wideInches = shortSide;
      highInches = longSide;
      dotsWide = dotsShort;
      dotsHigh = dotsLong;
    } else {
      orientation = "landscape";
      wideInches = longSide;
      highInches = shortSide;
      dotsWide = dotsLong;
      dotsHigh = dotsShort;
    }*/
    return true;
  }
  
}
