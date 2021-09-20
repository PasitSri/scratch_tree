ForTree tree;
void setup(){
    size(500, 500);
    background(255);
    tree = new ForTree();
    int size = 4;
    ForTree[] treea = new ForTree[size];
    for(int i=0; i<size; i++){
      treea[i] = new ForTree();
    }
    for(int i=0; i<size; i++){
      tree.add(treea[i]);
    }
    treea[2].add(new ForTree());
    treea[2].add(new ForTree());
    treea[2].add(new ForTree());
    treea[3].add(new ForTree());
    treea[2].add(new ForTree());
    treea[2].add(new ForTree());
}
void draw(){
  tree.draw(width/2, 50, 500);
}
