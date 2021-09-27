Tree all = new Tree();
Variable v;
IfTree i;
ForTree f;
void setup(){
  fullScreen();
  background(230);
  color c;
  noStroke();
  c = color(79, 128, 226);
  fill(c);
  rect(0, 0, width/5, height);
  c = color(255, 255, 255);
  fill(c);
  rect((width/5)*4, 0, width, height);
  c = color(0, 0, 0);
  fill(c);
  textSize(25);
  text("Output", (width/5)*4+10, 50);
  
  v = new Variable();
  v.setCommand("Variable");
  
  i = new IfTree();
  i.setCommand("");
  
  f = new ForTree();
  f.setCommand("10");
  all.setCommand("START");
  Variable v1 = new Variable();
  all.add(v1);
  v1.setCommand("a == 2");
  
  IfTree if2 = new IfTree();
  all.add(if2);
  if2.setCommand("b==5");
  
  ForTree f1 = new ForTree();
  all.add(f1);
    /*if2.setCommand("b==5");
    v1.setCommand("a=2");
    v2.setCommand("b=2");
    v3.setCommand("c=a+b");
    v4.setCommand("j=1/2");
    test.setCommand("a == b");*/
  f1.setCommand(10);
    /*test.add(v3);
    test.add(if2);
    all.add(v1);
    all.add(v2);
    all.add(test);
    all.add(v4);*/
  f1.add(v1);
  f1.add(v1);
  f1.add(v1);
   // System.out.println(all.getCommand());
}
void draw(){
  v.drawBlock(30,100);
  //System.out.println(v.getCommand());
  i.drawBlock(30,200);
  f.drawBlock(30,300);
  all.drawAllBlock((width/5)*2,100);
  //all.draw(width/2, height*0.8, width/2);
  //treea[2].draw(width/2, 300, 200);
}
