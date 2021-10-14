public class IfTree extends Tree{
  color c = color(#4ca64c);  //green
  Tree con = null;
  float Xa = 0;
  float W=50;
  boolean lockedCon = false;
  boolean locked = false;
  float xOffset=0, yOffset=0;
  boolean addState = false;

  IfTree(float x, float y){
    super(x, y);
    width = textWidth("if==")+40+(W*2)+30;
    height = textAscent()+10;
  }

  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  void setPosition(int x, int y){
    this.x=x;
    this.y=y;
    Xa = x+50;
  }

  void useFunction(){
    if(con != null){
      if(con.useCondition()){
        for(Tree e: array){
          e.useFunction();
        }
      }
    }
  }

  void edit() { 
    if(con!=null){
      con.edit();
    }
    for(Tree e: array){
      e.edit();
    }
  }

  void drawBlock(){
    fill(c);
    Xa = x+50;
    if(con != null){
      W = con.width;
    }else{
      W = 50;
    }
    width = textWidth("if")+W+30;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    if(con != null){
      con.setPosition(Xa, y);
      con.drawBlock();
    }else{
      fill(color(140));
      rect(Xa, y, W, height,30);
    }
    fill(0);
    textSize(20);
    fill(255);
    textSize(32);
    text("if", x+20, y+32);
  }

  void presses(){
    addState = true;
    if(mouseX>x && mouseX<x+width-W && mouseY>y && mouseY<y+height){
      locked = true;
    }else{
      locked = false;
    }
    if(con!=null){
      if(mouseX>Xa && mouseX<Xa+width && mouseY>y && mouseY<y+height){
        lockedCon = true;
      }else{
        lockedCon = false;
      }
    }

    xOffset = mouseX-x;
    yOffset = mouseY-y;
    for(Tree tree: array){
      tree.presses();
    }
    if(con!=null){
      con.presses();
    }
  }

  boolean dragedBlock(ArrayList all){
    if(locked){
      x=mouseX-xOffset;
      y=mouseY-yOffset;
      return true;
    }
    if(lockedCon){
      if(con != null){
        boolean ch = con.dragedBlock(all);
        if(ch){
          if((con.x<Xa || con.x>Xa+width ) || (con.y<y || con.y>y+height)){
            all.add(con);
            con = null;
          }
        }
      }
    }

    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      boolean ch = tree.dragedBlock(all);
      if(ch){
        if((tree.x<x || tree.x>x+width ) || (tree.y<y || tree.y>y+height)){
          remove(array.indexOf(tree));
          all.add(tree);
        }
      }
    }
    return false;
  }

  void checkAdd(ArrayList all, Tree newEl){
    Condition co = new Condition(x, y, "0");
    for(Tree e: array){
      e.checkAdd(all, newEl);
    }
    if(all.size()<=1){
      return;
    }
    if(newEl == null){
      return;
    }
    if(co.getClass().isAssignableFrom(newEl.getClass())){
      if(newEl.x>x+W && newEl.x<x+width && newEl.y>y && newEl.y<y+height){
        all.remove(all.indexOf(newEl));
        con = newEl;
      }
      return;
    }
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
    addState = false;
  }

  boolean keypressed(char KEY, int KEYCODE){
    if(con!=null){
      con.keypressed(KEY, KEYCODE);
    }
    for(Tree tree: array){
      tree.keypressed(KEY, KEYCODE);
    }
    return true;
  }

}
