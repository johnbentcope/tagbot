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
  
  
  // THIS IS NOT THE BEST IT COULD BE
  // ...
  // Sorry...
  public void makeIt(String orientation){
    noFill(); 
    strokeWeight(2);
    stroke(#FF0088);
    if (orientation == "landscape") {
      rectMode(CENTER);
      rect(width/2, height/2, high, wide);
      noStroke();
      rectMode(CORNERS);
      yMin = (height-wide)/2;
      yMax = height-yMin;
      xMin = (width-high)/2;
      xMax = width-xMin;
      fill(255, 150);
      rect(0,0, width, yMin);  //bottom
      rect(0, yMax, width, height); //top
      rect(0, yMin, xMin, yMax); //left
      rect(xMax, yMin, width, yMax); //right
    } else {
      rectMode(CENTER);
      rect(width/2, height/2, wide, high);
      noStroke();
      rectMode(CORNERS);
      yMin = (height-high)/2;
      yMax = height-yMin;
      xMin = (width-wide)/2;
      xMax = width-xMin;
      fill(255, 150);
      rect(0,0, width, yMin);  //bottom
      rect(0, yMax, width, height); //top
      rect(0, yMin, xMin, yMax); //left
      rect(xMax, yMin, width, yMax); //right
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
