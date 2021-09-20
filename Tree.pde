
class Tree{
  ArrayList<Tree> array = new ArrayList<Tree>();
  color c = color(255,100,100);
  void add(Tree a){
    array.add(a);
    
  }
  
  void drawSelf(float x, float y){
    fill(c);
    circle(x, y, 50);
    fill(255);
  }
  
  void draw(float x, float y, int w){
    drawSelf(x, y);
    for(int i=0; i<array.size(); i++){
      Tree tree = array.get(i);
      System.out.println(tree.getClass().getSimpleName());
      float newX;
      float newY = y+70;
      if(array.size()%2==1){
        newX = x+((i-(array.size()/2))*(w/array.size()));
        line(x, y, newX, newY);
        tree.draw(newX, newY, w/2);
      }else{
        float s = array.size()/2-0.5;
        System.out.println(s);
        newX = x+((i-s)*(w/array.size()));
        if(i<s){
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }else{
          tree.draw(newX, newY, w/2);
          line(x, y, newX, newY);
        }
      }
    }
  }
}