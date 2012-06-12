class Encoder {
  
  
  String derp = "";
  
  Encoder() {
  }
  // 30cm default high
  // 27cm horizontal inset 
  // 114cm apart
  // 60cm wide print area
  // 90cm tall print area
  
  public void gCodeify(PImage imgTiny){
    float STEPS = 200;
    float DIAM = 4;  // cm
    float CIRCUMFERENCE = DIAM * PI;
    float TPS = CIRCUMFERENCE / STEPS;
    int elev = 30;
    int horiOffset = 27;
    int machineWidth = 114;
    int printWidth = 60;
    int printHeight = 90;
    int horizSpacing = printWidth/imgTiny.width;
    int vertiSpacing = printHeight/imgTiny.height;
    String gString = "G20|G92|G90|G21";
    imgTiny.loadPixels();
    int arrayLen = imgTiny.pixels.length;
    //println("BEGIN");
    for ( int i = 0 ; i < imgTiny.height ; i++) {
      for ( int j = 0 ; j < imgTiny.width ; j++ ) {
        if (imgTiny.pixels[i*(imgTiny.width)+j] == color(0) ) {
          fill(255);
          ellipse(j*10, i*10,5, 5);
          float aPos = sqrt(sq(horiOffset+j*horizSpacing)+sq(elev+i*vertiSpacing));
          float bPos = sqrt(sq(horiOffset+(printWidth-j*horizSpacing))+sq(elev+i*vertiSpacing));
          gString += "|G1 ";
          gString += String.format("X%.5g ", aPos);
          gString += String.format("Y%.5g ", bPos);
          //gString += "\nM106 \nG4 P300\nM107";
          //gString += "\nM106 \nM107";
          //gString += String.format(";i: " + i + " j: " + j);
          //println( "aPos is " + aPos + " and bPos is " + bPos + " and i:j is " + i + ":"+ j);
        }
      }
    }
    //gString += "\nM106 \nG4 P300\nM107";
    String[] gCode = split(gString, '|');
    println(gString);
    println("end");
    /*
    for ( int i = 0 ; i < gCode.length ; i++ ) {
      String cmd = gCode[i];
      int cs = 0;
      for(i = 0; cmd[i] != '*' && cmd[i] != NULL; i++)
        cs = cs ^ cmd[i];
      cs &= 0xff;  // Defensive programming...
    }*/
    saveStrings("test.gcode", gCode);
  }
  
}
