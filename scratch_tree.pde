PImage img;
ArrayList<Tree> all = new ArrayList<Tree>();

IfTree i;
ForTree f; 
Run r;
Cat cat;
Move m;
Rotate Ro;
Equal eq;
NotEqual ne;
Greater gr;
Less le;

color c;
Tree current = null;
boolean dragedState = false;

void setup(){
  img = loadImage("ScratchCat.png");
  size(1000, 800);
  background(255);
  textSize(30);
  cat = new Cat();
  i = new IfTree(20, 100);
  f = new ForTree(20, 150);
  r = new Run(20, 50);
  m = new Move(20, 200);
  Ro = new Rotate(20, 250);
  eq = new Equal(20, 300);
  ne = new NotEqual(20, 350);
  gr = new Greater(20, 400);
  le = new Less(20, 450);
} //<>//
void draw(){ //<>//
  background(255);
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
  //println(cat.r);
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
  Ro.drawAllBlock(current);
  eq.drawAllBlock(current);
  ne.drawAllBlock(current);
  gr.drawAllBlock(current);
  le.drawAllBlock(current);
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
  if(mouseX>Ro.x && mouseX<Ro.x+Ro.width && mouseY>Ro.y && mouseY<Ro.y+Ro.height){
    Rotate newClass = new Rotate(Ro.x, Ro.y);
    all.add(newClass);
  }
  if(mouseX>f.x && mouseX<f.x+f.width && mouseY>f.y && mouseY<f.y+f.height){
    ForTree newClass = new ForTree(f.x, f.y);
    all.add(newClass);
  }
  if(mouseX>eq.x && mouseX<eq.x+eq.width && mouseY>eq.y && mouseY<eq.y+eq.height){
    Equal newClass = new Equal(eq.x, eq.y);
    all.add(newClass);
  }
  if(mouseX>ne.x && mouseX<ne.x+ne.width && mouseY>ne.y && mouseY<ne.y+ne.height){
    NotEqual newClass = new NotEqual(ne.x, ne.y);
    all.add(newClass);
  }
  if(mouseX>gr.x && mouseX<gr.x+gr.width && mouseY>gr.y && mouseY<gr.y+gr.height){
    Greater newClass = new Greater(gr.x, gr.y);
    all.add(newClass);
  }
  if(mouseX>le.x && mouseX<le.x+le.width && mouseY>le.y && mouseY<le.y+le.height){
    Less newClass = new Less(le.x, le.y);
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
