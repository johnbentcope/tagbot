class StateMachine {
  
  int state = 0;
  String stateString = "Strike a pose!";
  
  public int globalState() {
    return state;
  }
  
  public boolean setState(int newstate) {
    state = newstate;
    return true;
  }
  
  public boolean aButton() {
    if ( state == 0 || state == 2 ) {
      state = 1;
      return true;
    } else {
      state = 0;
      return true;
    }
  }
  
  public boolean sButton(Canvas canvas){
    canvas.flipOrientation();
    if (state == 2 ) {
      state = 1;
    }
    return true;
    
  }
  
  public boolean dButton() {
    if (state != 0) {
      state = 2;
      return true;
    } else {
      return false;
    }
  }
  
  public boolean cButton() {
    state = 3;
    return true;
  }
  
  public boolean gButton() {
    if (state == 3) {
      state = 4;
      return true;
    } else {
      return false;
    }
  }
  
  public boolean makeLogo() {
    fill(#FF0088);
    textAlign(RIGHT);
    textFont(creepster);
    text("TAG", width-10, 48);
    text("BOT", width-10, 88);
    return true;
  }
  
  public boolean displayState() {
    fill(#FF0088);
    textAlign(RIGHT);
    textFont(dillenia);
    switch (state) {
      case 0 :
        stateString = "Strike a pose!";
        break;
      case 1 :
        stateString = "Super Cool Preview";
        break;
      case 2:
        stateString = "Frozen";
        break;
      case 3:
        stateString = "Rough Approximation";
        break;
    }
    
    text(stateString, width-10, height-10);
    return true;
  }
  
  public boolean helpText() {
    fill(#FF0088);
    textAlign(LEFT);
    textFont(dillenia);
    text("A - Preview\nS - Rotate Canvas\nMouse - Adjust Colors", 10, 25);
    return true;  
  }
  
}
