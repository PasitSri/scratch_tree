public class Variable extends Tree{
  color c = color(#f67834);
  String Vname = "myVariable";
  String Vvalue = "100";
  String Vtype = " ";
  String current = "";
  int currentString = 0;
  void drawBlock(float x, float y){
    width = textWidth(command)+40;
    height = textAscent()+10;
    float Swidth = textWidth("Set ");
    float Twidth = textWidth(" to ");
    textSize(32);
    fill(c);
    rect(x, y, width, height,30);
    fill(200);
    rect(x+20+Swidth, y+5,textWidth(Vname)+15, height-10,30);
    fill(200);
    rect(x+20+Swidth +textWidth(Vname)+15 +Twidth, y+5,textWidth(Vvalue)+10, height-10,30);
    
    fill(255); 
    text("Set "+" "+Vname+" "+" to "+" "+Vvalue , x+20, y+32);
  }
  Variable(){
    setCommand();
  }

  void setCommand(){
    command = "Set "+" "+Vname+" "+" to "+" "+Vvalue;
  }
  void setVname(String s){
    Vname = s;
  }
  void setValue(String s){
    value = Integer.parseInt(s);
  }
  int getValue(){
    return value;
  }
}
