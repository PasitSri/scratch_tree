Tree all = new Tree();
Variable v;
IfTree i;
ForTree f;
String textState="";
int state=0;  
color c;
void setup(){
  i = new IfTree();
  /*fullScreen();*/
  size(500, 500);
  background(255);
}
void draw(){ //<>//
  /*background(255);*/
  /*noStroke();*/
  /*c = color(79, 128, 226);*/
  /*fill(c);*/
  /*rect(0, 0, width/5, height);*/
  /*c = color(255, 255, 255);*/
  /*fill(c);*/
  /*rect((width/5)*4, 0, width, height);*/
  /*c = color(0, 0, 0);*/
  /*fill(c);*/
  /*textSize(25);*/
  /*text("Output", (width/5)*4+10, 50);*/
  v = new Variable();
  f = new ForTree();
  /*v.drawBlock(50, 100);*/
  i.drawBlock(50, 200);
  /*println(i.selectedA, i.selectedB);*/
  /*println(i.x, i.x+i.width);*/
  /*println(mouseX, mouseY);*/
  /*f.drawBlock(50, 300);*/
  
  /*all.setCommand("Start");*/
  /*all.setPosition(width*0.5, 40);*/
  
  /*all.drawAllBlock();*/
  /*all.draw(width/2, height*0.5, width/2);*/
  /*fill(0);*/
  /*text(textState, width*0.9, 100);*/
}

void keyPressed(){
  i.KEYPRESSED(key, keyCode); //<>//
}

void mousePressed(){
  i.press(mouseX, mouseY); //<>//
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
