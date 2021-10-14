public class Rotate extends Tree{
  color c = color(#ef6f53);  //green
  boolean selectedA = false;
  int La =1;
  float a=0, b=0;
  int W=50;
  color BackgroundSelected = color(160, 160, 160);
  color Background = color(140, 140, 140);
  float Xa, Xb;
  String Sa="0";
  
  Rotate(float x, float y){
    super(x, y);
    width = textWidth("Move")+40+(W*2)+30;
    height = textAscent()+10;
  }
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }
  void drawBlock(){
    fill(c);
    this.x=x;
    this.y=y;
    Xa = x+textWidth("Rotate")+30;
    width = textWidth("Rotate")+50;
    height = textAscent()+10;
    rect(x, y, width+50, height,30);
    if(selectedA){
      fill(BackgroundSelected);
    }else{
      fill(Background);
    }
    rect(x+textWidth("Rotate")+30 , y,50, height,30);
    fill(0);
    textSize(20);
    text(Sa,Xa, y+32);
    fill(255);
    textSize(32);
    text("Rotate", x+20, y+32);
  }
  void setPosition(int x, int y){
    this.x=x;
    this.y=y;
    Xa = x+textWidth("Rotate")+30;
  }
  
  void useFunction(){
    if(!Sa.equals("")){
      int newNumber = Integer.valueOf(Sa);
      cat.rotate(newNumber);
    }
  }


  void edit() { 
    int mx = mouseX;
    int my = mouseY;
    if (overBox(mx, my) == 1) {
      selectedA = true;
    }
    else if(overBox(mx, my)==0) {
      selectedA = false;
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
        //boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        //boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');

        if (isKeyNumber) {
          addText(KEY, 1);
        }
      }
    }
    for(Tree e:array){
      e.keypressed(KEY, KEYCODE);
    }

    return false;
  }

  private void addText(char text, int state) {
    textSize(20);
    if (textWidth(Sa + text) < W) {
      Sa += text;
      a = float(Sa);
      La++;
    }
  }
  private void BACKSPACE(int state) {
    if (La - 1 >= 0) {
      Sa = Sa.substring(0, La - 1);
      a = float(Sa);
      La--;
    }
  }
  private int overBox(int x, int y) {
    if (x >= Xa && x <= Xa + W) {
      if (y >= this.y && y <= this.y + height) {
        return 1;
      }
    }
    return 0;
  }
}
