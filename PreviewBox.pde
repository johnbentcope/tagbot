class PreviewBox {
  
  int xMin = 20;
  int yMin = 20;
  
  int xMax = width-20;
  int yMax = height-20;
  
  int high = height - yMin*2;
  
  int wide = floor((2*high)/3);
  
  PreviewBox(int tempxMin, int tempyMin, int tempxMax, int tempyMax) {
    xMin = tempxMin;
    yMin = tempyMin;
    xMax = tempxMax;
    yMax = tempyMax;
  }
  
  public void makeIt(String orientation){
    noFill(); 
    if (orientation == "landscape") {
      rect(width/2, height/2, high, wide);
    } else {
      rect(width/2, height/2, wide, high);
    }
    //print(high);
    //println(wide);
    
    
  }
  
  public int xMin() {
    return xMin;
  }
  
  public int xMax() {
    return xMin;
  }
  
  public int yMin() {
    return xMin;
  }
  
  public int yMax() {
    return xMin;
  }
  

  
}
