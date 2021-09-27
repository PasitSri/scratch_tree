public class EOP extends Tree{
  color c = #ed6146;  //red
  String command = "End Of Process";
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
}
