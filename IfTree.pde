public class IfTree extends Tree{
  color c = color(#4ca64c);  //green
  Tree condition;
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  IfTree(){
    setCommand("");
  }
  
  void useCommand(){
    if(condition.useCommand()){
      for(int i=0; i<array.size();i++){
        Tree tree = array.get(i);
        tree.useCommand();
    }
  }

  void setCondition(boolean s){
    command = s;
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
    width = textWidth(command)+40;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(255);
    textSize(32);
    text(command, x+20, y+32);
  }

}
