public class Variable extends Tree{
  color c = color(#f67834);
  void drawBlock(float x, float y){
    fill(c);
    width = textWidth(command)+40;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(255);
    textSize(32);
    text(command, x+20, y+32);
  }

  Variable(){
    setCommand("a=");
  }

  void setCommand(String s){
    command = s;
  }

  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  String getCommand(){
    return command+";";
  }
}
