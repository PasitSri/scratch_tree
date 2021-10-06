public class IfTree extends Tree{
  color c = color(#4ca64c);  //green
  boolean selectedB = true;
  boolean selectedA = true;
  String Text = "";
  int La =0, Lb = 0;
  float a=0, b=0;
  int W=50;
  color BackgroundSelected = color(160, 160, 160);
  color Background = color(140, 140, 140);
  float Xa, Xb;
  String Sa="", Sb="";

  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  void PRESSED(int x, int y) {
    if (overBox(x, y) == 1) {
      selectedA = true;
      selectedB = false;
    }else if(overBox(x, y) == 2){
      selectedA = false;
      selectedB = true;
    }
    else if(overBox(x, y)==0) {
      selectedA = false;
      selectedB = false;
    }
  }

  void drawBlock(float x, float y){
    fill(c);
    this.x=x;
    this.y=y;
    Xa = x+50;
    Xb = x+170;
    width = textWidth("if==")+40+100+30;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    if(selectedA){
      fill(BackgroundSelected);
      println("hi");
    }else{
      fill(Background);
    }
    rect(x+50, y, W, height,30);
    fill(0);
    if(selectedB){
      fill(BackgroundSelected);
    }else{
      fill(Background);
    }
    rect(x+170, y, W, height,30);
    fill(0);
    text(Sa, Xa, y+32);
    text(Sb, Xb, y+32);
    fill(255);
    textSize(32);
    text("if", x+20, y+32);
    text("=", x+20+100, y+32);
  }

  boolean KEYPRESSED(char KEY, int KEYCODE) {
    println(selectedA,selectedB);
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

    return false;
  }

  private void addText(char text, int state) {
    // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
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

