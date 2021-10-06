ArrayList<Tree> all = new ArrayList<Tree>();
IfTree i;
ForTree f; 
color c;
void setup(){
  /*fullScreen();*/
  size(1000, 500);
  background(255);
  textSize(30);
  i = new IfTree(20, 100);
  f = new ForTree(20, 150);
}
void draw(){ //<>//
  background(255);
  noStroke();
  c = color(79, 128, 226);
  fill(c);
  rect(0, 0, width*0.3, height);
  c = color(255, 255, 255);
  fill(c);
  rect((width/5)*4, 0, width, height);
  c = color(0, 0, 0);
  fill(c);
  textSize(25);
  text("Output", (width/5)*4+10, 50);
  i.drawAllBlock();
  f.drawAllBlock();
  println(f.x, f.y, f.width, f.height);
  println(mouseX, mouseY);
  
}

void keyPressed(){
}

void mousePressed(){
  f.presses();
  i.presses();
}

void mouseDragged(){
  i.dragedBlock();
  f.dragedBlock();
}
