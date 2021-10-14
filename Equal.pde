public class Equal extends Condition{
  String operation = "=";

  Equal(float x, float y){
    super(x, y, "=");
    width = textWidth(operation)+(W*2)+30+20;
    height = textAscent()+10;
  }

  boolean useCondition(){
    return a==b;
  }
}
