public class OutPut extends Tree{
  color c = color(#15cdca);
  String command = "Out put ";
  void drawBlock(float x, float y){
    fill(c);
    rect(x, y, textWidth(command)+20, textAscent()+10,30);
    fill(0);
    textSize(32);
    text(command,x+10, y+32);  
  }
  void setCommand(Tree a){
    String v = a.getCommand();
    int i = 0;
    command = "Out put ";
    while(v.charAt(i) != '='){
      command += v.charAt(i);
      i++;
    }
    OutputPage.add(a);
  }
/*  String getCommand(){
    return command+";";
  }*/
}
