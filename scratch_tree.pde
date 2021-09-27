Tree all = new Tree();
Variable v;
IfTree i;
ForTree f;
String textState="";
int state=0;
void setup(){
  v = new Variable();
  i = new IfTree();
  f = new ForTree();
  f.setCommand(10);
  v.setCommand("a=");
  i.setCommand("");
  size(1300, 900);
  background(255);
    Variable v1 = new Variable();
    Variable v2 = new Variable();
    Variable v3 = new Variable();
    Variable v4 = new Variable();
    IfTree test = new IfTree();
    IfTree if2 = new IfTree();
    ForTree f1 = new ForTree();
    if2.setCommand("b==5");
    all.setCommand("Start");
    v1.setCommand("a=2");
    v2.setCommand("b=2");
    v3.setCommand("c=a+b");
    v4.setCommand("j=1/2");
    test.setCommand("a == b");
    f1.setCommand(10);
    /*test.add(v3);*/
    /*test.add(if2);*/
    /*all.add(v1);*/
    /*all.add(v2);*/
    /*all.add(test);*/
    /*all.add(v4);*/
    /*all.add(f1);*/
    /*f1.add(v1);*/
    /*f1.add(v1);*/
    /*f1.add(v1);*/
    
}
void draw(){
  background(255);
  v.drawBlock(100, 100);
  i.drawBlock(100, 200);
  f.drawBlock(100, 300);
  fill(10);
  rect(100, 400, 100, 50);
  all.drawAllBlock(500, 40);
  all.draw(width/2, height*0.5, width/2);
  //treea[2].draw(width/2, 300, 200);
  fill(0);
  text(textState, 900, 100);
  System.out.println(all.getCommand());
}


void mousePressed(){
  if(state==1){
    all.checkAllBlock(500, 40, new Variable());
  }
  else if(state==2){
    all.checkAllBlock(500, 40, new IfTree());
  }
  else if(state==3){
    all.checkAllBlock(500, 40, new ForTree());
  }
  else if(state==4){
    all.checkRemove(500, 40);
  }

  if(mouseX>100 && mouseX<200 && mouseY>100 && mouseY<132){
    state=1;
    textState="Var";
  }
  else if(mouseX>100 && mouseX<200 && mouseY>200 && mouseY<232){
    state=2;
    textState="If";
  }
  else if(mouseX>100 && mouseX<200 && mouseY>300 && mouseY<332){
    state=3;
    textState="For";
  }
  else if(mouseX>100 && mouseX<200 && mouseY>400 && mouseY<432){
    state=4;
    textState="Remove";
  }
  else{
    state=0;
    textState="";
  }
}
