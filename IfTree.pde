public class IfTree extends Tree{
  color c = color(#4ca64c);  //green
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  IfTree(){
    setCommand("");
  }

  void setCommand(String s){
    command = "if("+s+")";
  }

  String getCommand(){
    String result = command;
    result += "{";
      for(int i=0; i<array.size(); i++){
        Tree tree = array.get(i);
        result += tree.getCommand();
      }
    result += "}";
    return result;
  }

  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command), textAscent()+10);
    fill(0);
    textSize(32);
    text(command, x, y+32);
  }

}
