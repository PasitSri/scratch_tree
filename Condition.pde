public class Condition extends Tree{
  int a, b;
  boolean useCommand(){
   return a==b; 
  }
  
  void setA(String s){
    a = Integer.parseInt(s);
  }
  
  void setB(String s){
    b = Integer.parseInt(s);
  }
}
