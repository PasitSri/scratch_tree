public class Variable extends Tree{
  color c = color(#feb249);
  String command = "",Vname,Value;
  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command)+20, textAscent()+10,30);
    fill(0);
    textSize(32);
    text(command, x+10, y+32);
  }

  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }
  void setCommand(String s,String n){
    Vname = s;
    Value = n;
    if(n!="" && n!=" "){
      command = Vname + "=" + Value;
    }
    else{
      command = s;
    }
  }
  String getCommand(){
    return command+";";
  }
}
