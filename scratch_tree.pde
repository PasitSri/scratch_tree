Tree tree;
void setup(){
    size(500, 500);
    background(255);
    tree = new Tree();
    int size = 7;
    IfTree[] treea = new IfTree[size]; //<>//
    for(int i=0; i<size; i++){
      treea[i] = new IfTree();
    }
    for(int i=0; i<size; i++){
      tree.add(treea[i]);
    }
    treea[0].add(new IfTree());
    treea[2].add(new IfTree());
    treea[2].add(new Tree());
    treea[2].add(new ForTree());
    treea[2].add(new ForTree());
    treea[3].add(new Tree());
    
}
void draw(){
  tree.draw(width/2, 50, 500);
}
