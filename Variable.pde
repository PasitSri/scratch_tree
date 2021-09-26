public class Variable extends Tree{
  color c = color(#42a5f5);
  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command), textAscent()+10);
    fill(0);
    textSize(32);
    text(command, x, y+32);
  }

  String getCommand(){
    return command+";";
  }
}
