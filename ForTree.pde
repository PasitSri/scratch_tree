public class ForTree extends Tree{
  color c = color(#9ecee6);  //sky
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  ForTree(){
    setCommand(10);
  }

  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command), textAscent()+10);
    fill(0);
    textSize(32);
    text(command, x, y+32);
  }

  void setCommand(int n){
    command = String.format("for(int i=0; i<%d; i++)", n);
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
}
