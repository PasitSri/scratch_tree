import java.util.Iterator;
public class Tree{
  color c = #fead4c;  //red
  String command = "";
  ArrayList<Tree> array = new ArrayList<Tree>();
  float width = 0;
  float height = 0;
  float x = 0;
  float y = 0;
  boolean locked = false;
  float xOffset=0, yOffset=0;
  boolean addState = false;

  Tree(float x, float y){
    this.x=x;
    this.y=y;
    width = textWidth("run")+40;
    height = textAscent()+10;
  }

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

  void edit(){
    for(Tree tree: array){
      tree.edit();
    }
  }

  boolean dragedBlock(ArrayList all){
    if(locked){
      x=mouseX-xOffset;
      y=mouseY-yOffset;
      return true;
    }
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      boolean ch = tree.dragedBlock(all);
      if(ch){
        println(x, y, x+width, y+height);
        println(tree.x, tree.y);
        if((tree.x<x || tree.x>x+width ) || (tree.y<y || tree.y>y+height)){
          println("hi");
          remove(array.indexOf(tree));
          all.add(tree);
        }
      }
    }
    return false;
  }

  void presses(){
    addState = true;
    if(mouseX>x && mouseX<x+width && mouseY>y && mouseY<y+height){
      locked = true;
    }else{
      locked = false;
    }

    xOffset = mouseX-x;
    yOffset = mouseY-y;
    for(Tree tree: array){
      tree.presses();
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

  void drawBlock(){
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

  int checkHover(float nX, float nY){
    if(nX>x && nX<x+width/2 && nY>y+20 && nY<y+height){
      return 1;
    }
    else if(nX>x+width/2 && nX<x+width && nY>y+20 && nY<y+height){
      return 2;
    }
    return 0;
  }

  void checkAdd(ArrayList all, Tree newEl){
    int check = checkHover(newEl.x, newEl.y);
    if(check == 2){
      all.remove(all.indexOf(newEl));
      add(newEl, 0);
      return ;
    }
    for(int i=0; i<array.size(); i++){
      Tree e = array.get(i);
      e.addState = true;
      int checkNode = e.checkHover(newEl.x, newEl.y);
      if(checkNode == 1){
        all.remove(all.indexOf(newEl));
        add(newEl, i+1);
        return ;
      }
    }
    for(Tree e: array){
      e.checkAdd(all, newEl);
    }
    addState = false;
  }


  /*int checkAllBlock(Tree tree){*/
    /*int check = checkHover();*/
    /*int h=0;*/
    /*if(check == 2){*/
      /*add(tree, 0);*/
      /*System.out.println("add");*/
      /*return 0;*/
    /*}*/
    /*for(int i=0; i<array.size(); i++){*/
      /*int c=0;*/
      /*Tree t = array.get(i);*/
      /*h += 42;*/
      /*t.setPosition(x+25, y+h);*/
      /*c = t.checkAllBlock(tree);*/
      /*h += 42*t.getSize();*/
      /*if(c == 1){*/
        /*add(tree, i+1);*/
        /*System.out.println("add");*/
      /*}*/
    /*}*/
    /*return check;*/
  /*}*/


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

  void drawAllBlock(Tree e){
    drawBlock();
    int l;
    if(addState){
      l = checkHover(e.x, e.y);
    }else{
      l = checkHover(this.x, this.y);
    }
    if(l==1){
      stroke(#9162e4);
      strokeWeight(10);
      line(x, y+height, x+width/2, y+height);
      stroke(0);
      strokeWeight(0);
    }else if(l==2){
      stroke(#ff8a80);
      strokeWeight(10);
      line(x+width/2, y+height, x+width, y+height);
      stroke(0);
      strokeWeight(0);
    }
    int h=0;
    for(Tree tree: array){
      h += 42;
      tree.setPosition(x+25, y+h);
      tree.drawAllBlock(e);
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
