class Blob {
  
  
  
  Blob(int blobWide, int blobHigh) {
    int[][] blobs = new int[blobWide][blobHigh];
  }

  public int[][] copyBlobs(){
    return blobs;
  }
  
  int xBlobPos() {
    return -1;
  }
  
  int xPixelPos() {
    return -1;
  }
  
  int yBlobPos() {
    return -1;
  }
  
  int yPixelPos() {
    return -1;
  }
  
  color getBlobColor(Blob blob){
    return color(255, 0, 126);
  }
  
  void setColor(Blob blob, color blobColor) {

  }
  
}
