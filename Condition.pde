public class Condition extends Tree{
  color c = color(#ef536d);
  boolean selectedB = false;
  boolean selectedA = false;
  int La =1, Lb = 1;
  float a=0, b=0;
  int W=50;
  color BackgroundSelected = color(160, 160, 160);
  color Background = color(140, 140, 140);
  float Xa, Xb;
  String Sa="0", Sb="0";
  String operation = "=";

  Condition(float x, float y, String operation){
    super(x, y);
    width = textWidth(operation)+(W*2)+30+20;
    height = textAscent()+10;
    this.operation = operation;
  }

  boolean useCondition(){
    return false;
  }

  void setPosition(int x, int y){
    this.x=x;
    this.y=y;
    Xa = this.x+10;
    Xb = Xa+W+40;
  }

  void drawBlock(){
    fill(c);
    Xa = x+10;
    Xb = Xa+W+40;
    rect(x, y, width, height,30);
    if(selectedA){
      fill(BackgroundSelected);
    }else{
      fill(Background);
    }
    rect(Xa, y, W, height,30);
    fill(0);
    if(selectedB){
      fill(BackgroundSelected);
    }else{
      fill(Background);
    }
    rect(Xb, y, W, height,30);
    fill(0);
    textSize(20);
    text(Sa, Xa, y+32);
    text(Sb, Xb, y+32);
    fill(255);
    textSize(32);
    text(operation, Xa+W+5, y+32);
  }

  void edit() { 
    int mx = mouseX;
    int my = mouseY;
    if (overBox(mx, my) == 1) {
      selectedA = true;
      selectedB = false;
    }else if(overBox(mx, my) == 2){
      selectedA = false;
      selectedB = true;
    }
    else if(overBox(mx, my)==0) {
      selectedA = false;
      selectedB = false;
    }
    for(Tree e: array){
      e.edit();
    }
  }

  boolean keypressed(char KEY, int KEYCODE) {
    if (selectedA) {
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE(1);
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ', 1);
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(KEY, 1);
        }
      }
    }
    if (selectedB) {
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE(2);
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ', 2);
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        // CHECK IF THE KEY IS A LETTER OR A NUMBER
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
          addText(KEY, 2);
        }
      }
    }

    for(Tree e:array){
      e.keypressed(KEY, KEYCODE);
    }

    return false;
  }

  private void addText(char text, int state) {
    // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
    textSize(20);
    if(state==1){
      if (textWidth(Sa + text) < W) {
        Sa += text;
        a = float(Sa);
        La++;
      }
    }
    if(state==2){
      if (textWidth(Sb + text) < W) {
        Sb += text;
        b = float(Sb);
        Lb++;
      }
    }
  }

  private void BACKSPACE(int state) {
    if(state==1){
      if (La - 1 >= 0) {
        Sa = Sa.substring(0, La - 1);
        a = float(Sa);
        La--;
      }
    }
    if(state==2){
      if (Lb - 1 >= 0) {
        Sb = Sb.substring(0, Lb - 1);
        b = float(Sb);
        Lb--;
      }
    }
  }

  // FUNCTION FOR TESTING IS THE POINT
  // OVER THE TEXTBOX
  private int overBox(int x, int y) {
    if (x >= Xa && x <= Xa + W) {
      if (y >= this.y && y <= this.y + height) {
        return 1;
      }
    }
    else if (x >= Xb && x <= Xb + W) {
      if (y >= this.y && y <= this.y + height) {
        return 2;
      }
    }
    return 0;
  }
}
