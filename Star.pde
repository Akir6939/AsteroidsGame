class Star //note that this class does NOT extend Floater
{
  private int myColor,myOpacity;
  private float myX,myY;
  public Star(float x,float y)
  {
    myOpacity = 127;
  	myX = x;
  	myY = y;
  	myColor = color(255,255,255);
  }
  public float getX()
  {
  	return myX;
  }
  public float getY()
  {
  	return myY;
  }
  public void setX(float x)
  {
  	myX = x;
  }
  public void setY(float y)
  {
  	myY = y;
  }
  public void setOpacity(int opacity)
  {
    myOpacity = opacity;
  }
  public void show()
  {
  	strokeWeight(1);
  	fill(myColor,myOpacity);
  	stroke(myColor,myOpacity);
  	ellipse(myX,myY,5,5);
  }
  public void pulse()
  {
    if(myOpacity>=255)
      myOpacity = 0;
    myOpacity+=(int)(Math.random()*8)-2;
  }
}
