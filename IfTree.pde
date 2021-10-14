public class IfTree extends Tree{
  color c = color(#4ca64c);  //green
  Condition con = null;
  float Xa = 0;
  int W=50;

  IfTree(float x, float y){
    super(x, y);
    width = textWidth("if==")+40+(W*2)+30;
    height = textAscent()+10;
  }

  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }

  void setPosition(int x, int y){
    this.x=x;
    this.y=y;
    Xa = x+50;
  }

  void useFunction(){
    if(con != null){
      if(con.useCondition()){
        for(Tree e: array){
          e.useFunction();
        }
      }
    }
  }

  void edit() { 
    for(Tree e: array){
      e.edit();
    }
  }

  void drawBlock(){
    fill(c);
    Xa = x+50;
    width = textWidth("if")+W+30;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(color(140));
    rect(Xa, y, W, height,30);
    fill(0);
    textSize(20);
    fill(255);
    textSize(32);
    text("if", x+20, y+32);
  }

}
