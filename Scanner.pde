class Scanner {




  float xPos = xMin;
  float yPos = yMin;
  int flip = 0;

  Scanner() {
  }

  boolean update() {



    return true;
  }


  void render() {

    // plot a dot on the screen with each pass
    fill(get(floor(xPos), floor(yPos)));
    noStroke();
    ellipse(xPos, yPos, 2, diam);

    // This part os for the bounding box
    stroke(255);
    noFill();
    strokeWeight(5);
    //rect(xMin, yMin, xMax, yMax);
  }

  void setGrid() {
  }

  void displayGrid() {
  }

  void run() {


    setGrid();

    if (update()) {
      //render();
    } 
    else {
      //ellipse(xPos, yPos-step, 2, diam);
    }
  }
}

