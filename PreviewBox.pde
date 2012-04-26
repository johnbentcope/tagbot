class PreviewBox {
  
  int xMin = 30;
  int yMin = 30;
  
  int xMax = width-30;
  int yMax = height-30;
  
  PreviewBox(int tempxMin, int tempyMin, int tempxMax, int tempyMax) {
    xMin = tempxMin;
    yMin = tempyMin;
    xMax = tempxMax;
    yMax = tempyMax;
  }
  
  void makeIt(){
    rect(xMin, yMin, xMax, yMax);
  }
  
  int xMin() {
    return xMin;
  }
  
  int xMax() {
    return xMin;
  }
  
  int yMin() {
    return xMin;
  }
  
  int yMax() {
    return xMin;
  }
  
}
