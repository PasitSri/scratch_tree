public class ForTree extends Tree{
  color c = color(#9ecee6);  //sky
  int n=0;
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  ForTree(float x, float y){
    super(x, y);
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

  void setRepeat(int x){
    n = x;
  }
  
  void useCommand(){
    for(int i=0; i<n; i++){
      for(int j=0; j<array.size(); j++){
        Tree tree = array.get(i);
        tree.useCommand();
      }
    }
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
