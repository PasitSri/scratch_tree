public class Cat{
<<<<<<< HEAD
  PImage img = loadImage("ScratchCat.png");
  float x = (width/5)*4, y = height/2;
  float CatSize = 100;
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
  void move(float n){
    x+=n;
  }
  
  void display(){
    image(img, getX(), getY(), CatSize, CatSize);
=======
  PImage piccat;
  float posx, posy, picWidth, picHeight, rad = 0;
  
  Cat(int size,int posx,int posy) {
    piccat = loadImage("cat.png");
    picWidth = 2*size;
    picHeight = 2*size;
    this.posx = posx;
    this.posy = posy;
  }  
  
  void draws() {
    pushMatrix();
    translate(posx,posy);
    rotate(rad);
    translate(-picWidth/2,-picHeight/2);
    image(piccat,0,0,picWidth,picHeight);
    popMatrix();
  }
  
   void move(int x) { 
     posx+=x;
>>>>>>> 4d66755c8d5b2852db9ba5437eba994f51de493f
  }
}
