public class ForTree extends Tree{
  color c = color(#b569af);
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }
  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command)+20, textAscent()+10,30);
    fill(0);
    textSize(32);
    text(command, x+10, y+32);
  }

  void setCommand(int n){
    command = "for(int i=0; i<"+str(n)+"; i++)";
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
