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
    width = textWidth(command)+40;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(255);
    textSize(32);
    text(command, x+20, y+32);
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
