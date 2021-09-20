public class IfTree extends Tree{
  color c = color(2,100,25);
  void draw(float x, float y, int w){
    fill(c);
    circle(x, y, 50);
    fill(255);
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      float newX;
      float newY = y+70;
      if(array.size()%2==1){
        newX = x+((i-(array.size()/2))*(w/array.size()));
        line(x, y, newX, newY);
        tree.draw(newX, newY, w/2);
      }else{
        float s = array.size()/2;
        if(i<s){
          newX=x-((i+1)*w/array.size());
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }else{
          newX=x+((i-1)*w/array.size());
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }
      }
    }
  }
}
