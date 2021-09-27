public class IfTree extends Tree{
  color c = color(#56407f);
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
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
      rect(x, y, textWidth(command)+20, textAscent()+10,30);
    fill(0);
    textSize(32);
    text(command, x+10, y+32);
  }

}
