class Star //note that this class does NOT extend Floater
{
  int myColor;
  float myX,myY;
  public Star(float x,float y){
  	myX = x;
  	myY = y;
  	myColor = color(255,255,255);
  }
  public float getX(){
  	return myX;
  }
  public float getY(){
  	return myY;
  }
  public void setX(float x){
  	myX = x;
  }
  public void setY(float y){
  	myY = y;
  }
  public void show(){
  	fill(myColor);
  	stroke(myColor);
  	ellipse(myX,myY,5,5);
  }
}
