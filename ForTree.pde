
class ForTree{
  ArrayList<ForTree> array = new ArrayList<ForTree>();
  void add(ForTree a){
    array.add(a);
  }
  
  void draw(float x, float y, int w){
    circle(x, y, 50);
    for(int i=0; i<array.size(); i++){
      ForTree tree = array.get(i);
      float newX;
      float newY = y+70;
      if(array.size()%2==1){
        newX = x+((i-(array.size()/2))*(w/array.size()));
        System.out.println(array.size());
        line(x, y, newX, newY);
        tree.draw(newX, newY, w/2);
      }else{
        float s = array.size()/2;
        System.out.println(array.size());
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
