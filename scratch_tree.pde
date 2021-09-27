Tree all = new Tree();
Tree OutputPage = new Tree();
Variable v;
IfTree i;
ForTree f;
EOP e;
OutPut o;
void setup(){
  fullScreen();
  background(230);
  StartPage();
  Variable v1 = new Variable();
  v1.setCommand("A","1000");
  all.add(v1);
  OutPut o1 = new OutPut();
  all.add(o1);
  o1.setCommand(v1);
  
  Variable v2 = new Variable();
  v2.setCommand("B","500");
  all.add(v2);
  OutPut o2 = new OutPut();
  all.add(o2);
  o2.setCommand(v2);
  
  Variable v3 = new Variable();
  v3.setCommand("Dog","1500");
  all.add(v3);
  OutPut o3 = new OutPut();
  all.add(o3);
  o3.setCommand(v3);
  
  all.add(o2);
  o2.setCommand(v2);
  
  all.add(e);
}

void draw(){
  all.drawAllBlock((width/5)*2,100);
  OutputPage.drawAllBlock((width/5)*4+10,100);
}

void StartPage(){
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
  all.setCommand("START");
  
  v = new Variable();
  v.setCommand("Variable     "," ");
  
  i = new IfTree();
  i.setCommand("");
  
  f = new ForTree();
  f.setCommand("Loop For");
  o = new OutPut();
  e = new EOP();
  OutputPage.setCommand("Out put");
  
  v.drawBlock(30,100);
  i.drawBlock(30,150);
  f.drawBlock(30,200);
  o.drawBlock(30,250);
}
