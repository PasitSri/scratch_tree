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
  void getCoordinates(){
    String Coordinates;
    Coordinates = "X : "+str(getX())+",Y : "+str(getY());
    fill(0);
    textSize(15);
    text(Coordinates, (width/5)*4+10, 50+20);
  }
  void display(){
    image(img, getX(), getY(), CatSize, CatSize);
  }
}
