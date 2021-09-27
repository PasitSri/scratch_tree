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
  size(1300, 900);
  background(255);
  all.setCommand("Start");
  all.setPosition(width*0.5, 40);
    
}
void draw(){
  background(255);
  v.drawBlock(100, 100);
  i.drawBlock(100, 200);
  f.drawBlock(100, 300);
  fill(10);
  rect(100, 400, 100, 50);
  all.drawAllBlock();
  all.draw(width/2, height*0.5, width/2);
  //treea[2].draw(width/2, 300, 200);
  fill(0);
  text(textState, width*0.9, 100);
}


void mousePressed(){
  if(state==1){
    all.checkAllBlock(new Variable());
  }
  else if(state==2){
    all.checkAllBlock(new IfTree());
  }
  else if(state==3){
    all.checkAllBlock(new ForTree());
  }
  else if(state==4){
    all.checkRemove();
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
