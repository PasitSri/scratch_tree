PImage img;
ArrayList<Tree> all = new ArrayList<Tree>();
IfTree i;
ForTree f; 
Run r;
color c;
Cat cat;
Tree current = null;
boolean dragedState = false;
Move m;
void setup(){
  img = loadImage("ScratchCat.png");
  size(1000, 500);
  background(255);
  textSize(30);
  cat = new Cat();
  i = new IfTree(20, 100);
  f = new ForTree(20, 150);
  r = new Run(20, 50);
  m = new Move(20, 200);
}
void draw(){ //<>//
  background(255); //<>//
  noStroke();
  c = color(79, 128, 226);
  fill(c);
  rect(0, 0, width*0.3, height);
  fill(230);
  rect((width/5)*4, 0, width, height);
  c = color(0, 0, 0);
  fill(c);
  textSize(25);
  text("Output", (width/5)*4+10, 50);
  
  cat.display();
  if(dragedState){
    c = color(#F5224F);
    fill(c);
    rect(0, height*0.8, width*0.3, height);
  }
  cat.getCoordinates();
  fill(#38E071);
  circle(width*0.75, height*0.10, 50);
  i.drawAllBlock(current);
  f.drawAllBlock(current);
  r.drawAllBlock(current);
  m.drawAllBlock(current);
  for(Tree e:all){
    e.drawAllBlock(current);
  }
}

void keyPressed(){
  for(Tree e:all){
    e.keypressed(key, keyCode);
  }
}

void mousePressed(){
  dragedState = true;
  if(mouseX>width*0.75-25 && mouseX<width*0.75+25 && mouseY>height*0.1-25 && mouseY<height*0.1+25){
    for(Tree e:all){
      if(e.getClass().getSimpleName().equals("Run")){
        e.useFunction();
      }
    }
  }
  if(mouseX>r.x && mouseX<r.x+r.width && mouseY>r.y && mouseY<r.y+r.height){
    Run newClass = new Run(r.x, r.y);
    all.add(newClass);
  }
  if(mouseX>i.x && mouseX<i.x+i.width && mouseY>i.y && mouseY<i.y+i.height){
    IfTree newClass = new IfTree(i.x, i.y);
    all.add(newClass);
  }
  if(mouseX>m.x && mouseX<m.x+m.width && mouseY>m.y && mouseY<m.y+m.height){
    Move newClass = new Move(m.x, m.y);
    all.add(newClass);
  }
  /*if(mouseX>f.x && mouseX<f.x+f.width && mouseY>f.y && mouseY<f.y+f.height){
    ForTree newClass = new ForTree(f.x, f.y);
    all.add(newClass);
  }*/
  for(Tree e: all){
    e.presses();
  }
  for(Tree e: all){
    e.edit();
  }
}

void mouseDragged(){
  for(int i=0; i<all.size(); i++){
    Tree e = all.get(i);
    boolean ch = e.dragedBlock(all);
    if(ch){
      current = e;
    }
  }
}

void mouseReleased(){
  if(dragedState){
    for(int i=0; i<all.size(); i++){
      Tree e = all.get(i);
      e.checkAdd(all, current);
    }
  }
  dragedState = false;

  for(int i=0; i<all.size(); i++){
    Tree e = all.get(i);
    if(e.x<width*0.3){
      all.remove(i);
    }
  }
}
