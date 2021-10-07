public class Run extends Tree{
  color c = color(#A636F5);
  Run(float x, float y){
    super(x, y);
    width = textWidth("Runner")+40;
    height = textAscent()+10;
  }

  void drawBlock(){
    fill(c);
    width = textWidth("Runner")+40;
    height = textAscent()+10;
    rect(x, y, width, height,30);
    fill(255);
    textSize(32);
    text("Runner", x+20, y+32);
  }

  int checkHover(float nX, float nY){
    if(nX>x && nX<x+width && nY>y+20 && nY<y+height){
      return 2;
    }
    return 0;
  }

  void drawAllBlock(Tree e){
    drawBlock();
    int l = checkHover(x, y);
    if(e != null){
      if(addState){
        l = checkHover(e.x, e.y);
      }
    }
    if(l==2){
      stroke(#ff8a80);
      strokeWeight(10);
      line(x, y+height, x+width, y+height);
      stroke(0);
      strokeWeight(0);
    }
    int h=0;
    for(Tree tree: array){
      h += 42;
      tree.setPosition(x+25, y+h);
      tree.drawAllBlock(e);
      h += 42*tree.getSize();
    }
  }

  void useFunction(){
    for(Tree e:array){
      e.useFunction();
    }
  }
}
