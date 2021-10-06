public class Move extends Tree{
  void useCommand(Cat cat, int n){
    cat.move(n);
  }
  Move(float x, float y){
    super(x, y);
  }
}
