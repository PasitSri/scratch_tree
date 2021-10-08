public class Cat{
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
  }
}
