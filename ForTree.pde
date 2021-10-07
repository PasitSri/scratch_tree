public class ForTree extends Tree{
  color c = color(#9ecee6);  //sky
  boolean selected = false;
  int Ln =1;
  float n=0;
  int W=50;
  color BackgroundSelected = color(160, 160, 160);
  color Background = color(140, 140, 140);
  float Xn;
  String Sn="0";
  
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  ForTree(float x, float y){
    super(x, y);
    width = textWidth("repeat"+40+W+15);
    height = textAscent()+10;
  }

  void drawBlock(){
    fill(c);
    width = textWidth("repeat")+40+W+15;
    height = textAscent()+10;
    Xn = x+140;
    rect(x, y, width, height,30);
    if(selected){
      fill(BackgroundSelected);
    }else{
      fill(Background);
    }
    rect(Xn, y, W, height, 30);
    fill(0);
    textSize(20);
    text(Sn, Xn, y+32);
    fill(255);
    textSize(32);
    text("repeat", x+20, y+32);
  }

  void setRepeat(int x){
    n = x;
  }
  
  void useCommand(){
    for(int i=0; i<n; i++){
      for(int j=0; j<array.size(); j++){
        Tree tree = array.get(i);
        tree.useCommand();
      }
    }
  }

  void edit() { 
    int mx = mouseX;
    int my = mouseY;
    if (overBox(mx, my)) {
      selected = true;
    }else{
      selected = false;
    }
    for(Tree e: array){
      e.edit();
    }
  }

  boolean keypressed(char KEY, int KEYCODE) {
    if (selected) {
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE();
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ');
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(KEY);
        }
      }
    }
    for(Tree e:array){
      e.keypressed(KEY, KEYCODE);
    }

    return false;
  }

  private void addText(char text) {
    // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
    textSize(20);
    if (textWidth(Sn + text) < W) {
      Sn += text;
      n = float(Sn);
      Ln++;
    }
  }

  private void BACKSPACE() {
    if (Ln - 1 >= 0) {
      Sn = Sn.substring(0, Ln - 1);
      n = float(Sn);
      Ln--;
    }
  }

  private boolean overBox(int x, int y) {
    if (x >= Xn && x <= Xn + W) {
      if (y >= this.y && y <= this.y + height) {
        return true;
      }
    }
    return false;
  }
}
    
