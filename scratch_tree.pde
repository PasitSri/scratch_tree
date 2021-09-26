Tree all = new Tree();
void setup(){
  /*ForTree tree;*/
    /*IfTree[] treea;*/
  size(1300, 900);
  background(255);
    /*tree = new ForTree();*/
    /*int size = 5;*/
    /*treea = new IfTree[size]; //<>//*/
    /*for(int i=0; i<size; i++){*/
      /*treea[i] = new IfTree();*/
    /*}*/
    /*for(int i=0; i<size; i++){*/
      /*tree.add(treea[i]);*/
    /*}*/
    /*treea[0].add(new IfTree());*/
    /*treea[2].add(new IfTree());*/
    /*treea[2].add(new ForTree());*/
    /*treea[2].add(new ForTree());*/
    /*ForTree test = new ForTree();*/
    /*test.add(new IfTree());*/
    /*test.add(new ForTree());*/
    /*test.add(new ForTree());*/
    /*treea[2].add(test);*/
    /*tree.add(new ForTree());*/
    /*tree.draw(width/2, 50, 500);*/
    Variable v1 = new Variable();
    Variable v2 = new Variable();
    Variable v3 = new Variable();
    Variable v4 = new Variable();
    IfTree test = new IfTree();
    IfTree if2 = new IfTree();
    ForTree f = new ForTree();
    if2.setCommand("b==5");
    all.setCommand("Start");
    v1.setCommand("a=2");
    v2.setCommand("b=2");
    v3.setCommand("c=a+b");
    v4.setCommand("j=1/2");
    test.setCommand("a == b");
    f.setCommand(10);
    test.add(v3);
    test.add(if2);
    all.add(v1);
    all.add(v2);
    all.add(test);
    all.add(v4);
    all.add(f);
    f.add(v1);
    f.add(v1);
    f.add(v1);
    System.out.println(all.getCommand());
    
}
void draw(){
  all.drawAllBlock(500, 40);
  
  //treea[2].draw(width/2, 300, 200);
}
