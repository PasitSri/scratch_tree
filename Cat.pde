public class Cat{
  
  float x = (width/5)*4, y = height/2;
  float CatSize = 100;
  float ra = 0.4;
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
  void move(float n){
    x+=n;
  }
  
  void rotate(float a){
    ra = a;
  }
  
  void reset(){
    x = (width/5)*4;
    y = height/2;
  }
  void getCoordinates(){
    String Coordinates;
    Coordinates = "X : "+str(getX())+",Y : "+str(getY());
    fill(0);
    textSize(15);
    text(Coordinates, (width/5)*4+10, 50+20);
    textSize(30);
  }
  void display(){
  //imageMode(CENTER);
  //pushMatrix();
  //translate(x, y);
  rotate(0.2);
  //println(r);
  image(img, x, y, CatSize, CatSize);
  rotate(0);
  //popMatrix();
  }
}
