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
  for(Tree e:all){
    e.drawAllBlock();
  }
  
}

void keyPressed(){
  for(Tree e:all){
    e.keypressed(key, keyCode);
  }
}

void mousePressed(){
  if(mouseX>i.x && mouseX<i.x+i.width && mouseY>i.y && mouseY<i.y+i.height){
    println("test");
    IfTree newClass = new IfTree(i.x, i.y);
    all.add(newClass);
  }
  if(mouseX>f.x && mouseX<f.x+f.width && mouseY>f.y && mouseY<f.y+f.height){
    println("test2");
    ForTree newClass = new ForTree(f.x, f.y);
    all.add(newClass);
  }
  for(Tree e: all){
    e.presses();
  }
  for(Tree e: all){
    e.edit();
  }
}

void mouseDragged(){
  for(Tree e:all){
    e.dragedBlock();
  }
}
