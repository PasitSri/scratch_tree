
class Tree{
  String command = "";
  ArrayList<Tree> array = new ArrayList<Tree>();
  color c = color(#d11141);  //red
  void add(Tree a){
    array.add(a);
    
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
    fill(255);
    rect(x, y, textWidth(command), textAscent()+10);
    fill(0);
    textSize(32);
    text(command, x, y+32);
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

  void drawAllBlock(float x, float y){
    drawBlock(x, y);
    checkHover(x, y);
    int h=0;
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      h += 42;
      tree.drawAllBlock(x+25, y+h);
      h += 42*tree.getSize();
    }
  }

  int getSize(){
    return array.size();
  }
}
