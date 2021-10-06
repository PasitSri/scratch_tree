public class Tree{
  color c = #fead4c;  //red
  String command = "";
  ArrayList<Tree> array = new ArrayList<Tree>();
  float width = 0;
  float height = 0;
  float x = 0;
  float y = 0;

  void setPosition(float x, float y){
    this.x=x;
    this.y=y;
  }

  void add(Tree a, int e){
    array.add(e, a);
  }

  void remove(int e){
    array.remove(e);
  }
  
  void useCommand(){}
  void presses(){}

  void presses(int mx, int my){
    int h=0;
    for(Tree tree: array){
      tree.presses(mx, my);
    }
  }

  boolean keypressed(char KEY, int KEYCODE){
    for(Tree tree: array){
      tree.keypressed(KEY, KEYCODE);
    }
    return true;
  }
  
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  void setCommand(String s){
    command = s;
  }

  String getCommand(){
    String result = "";
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      result += tree.getCommand();
    }
    return result;
  }

  void drawBlock(float x, float y){
    fill(c);
    width = textWidth(command)+40;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(255);
    textSize(32);
    text(command, x+20, y+32);
  }
  
  void draw(float x, float y, int w){
    drawSelf(x, y);
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      //System.out.println(tree.getClass().getSimpleName());
      float newX;
      float newY = y+70;
      if(array.size()%2==1){
        newX = x+((i-(array.size()/2))*(w/array.size()));
        line(x, y, newX, newY);
        tree.draw(newX, newY, w/2);
      }else{
        float s = array.size()/2-0.5;
        //System.out.println(s);
        newX = x+((i-s)*(w/array.size()));
        if(i<s){
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }else{
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }
      }
    }
  }

  int checkHover(float x, float y){
    if(mouseX>x && mouseX<x+textWidth(command)/2 && mouseY>y && mouseY<y+35){
      stroke(#9162e4);
      strokeWeight(10);
      line(x, y+42, x+textWidth(command)/2, y+42);
      stroke(0);
      strokeWeight(0);
      return 1;
    }
    else if(mouseX>x+textWidth(command)/2 && mouseX<x+textWidth(command) && mouseY>y && mouseY<y+35){
      stroke(#ff8a80);
      strokeWeight(10);
      line(x+textWidth(command)/2, y+42, x+textWidth(command), y+42);
      stroke(0);
      strokeWeight(0);
      return 2;
    }
    else{
      stroke(255);
      strokeWeight(10);
      line(x, y+42, x+textWidth(command), y+42);
      stroke(0);
      strokeWeight(1);
      drawBlock(x, y);
      return 0;
    }
  }

  int checkAllBlock(Tree tree){
    int check = checkHover(x, y);
    int h=0;
    if(check == 2){
      add(tree, 0);
      System.out.println("add");
      return 0;
    }
    for(int i=0; i<array.size(); i++){
      int c=0;
      Tree t = array.get(i);
      h += 42;
      t.setPosition(x+25, y+h);
      c = t.checkAllBlock(tree);
      h += 42*t.getSize();
      if(c == 1){
        add(tree, i+1);
        System.out.println("add");
      }
    }
    return check;
  }

  int checkRemove(){
    int h=0;
    for(int i=0; i<array.size(); i++){
      Tree t = array.get(i);
      h += 42;
      t.setPosition(x+25, y+h);
      int a = t.checkRemove();
      if(a==1){
        return 1;
      }
      h += 42*t.getSize();
      if(mouseX>x+25 && mouseX<x+25+t.width && mouseY>y && mouseY<y+h+t.height+10){
        System.out.println("remove");
        remove(i);
        return 1;
      }
    }
    return 0;
  }

  void drawAllBlock(){
    drawBlock(x, y);
    checkHover(x, y);
    int h=0;
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      h += 42;
      tree.setPosition(x+25, y+h);
      tree.drawAllBlock();
      h += 42*tree.getSize();
    }
  }

  int getSize(){
    int size = array.size();
    for(int i=0; i<array.size(); i++){
      Tree t = array.get(i);
      size += t.getSize();
    }
    return size;
  }
}
