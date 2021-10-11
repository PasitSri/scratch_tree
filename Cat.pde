public class Cat{
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
  }
}
