class Spaceship extends Floater  
{   
	public Spaceship(){
    corners = 3;
    xCorners = new int[] {20,-20,-20};
    yCorners = new int[] {0,10,-10};
    myColor = color(192,192,192);
    myPointDirection = 0;
    myCenterX = 0;
    myCenterY = 0;
	}
	public void strobe(){
		noFill();
		strokeWeight(3);
		for(float i = 50.0;i<=65.0;i+=5.0){
			stroke((float)Math.random()*255,(float)Math.random()*255,(float)Math.random()*255,127);
			ellipse((float)myCenterX,(float)myCenterY,i,i);
		}
	}
  	public void setX(double d){
    	myCenterX = d;
  	}   
  	public void setY(double d){
    	myCenterY = d;
  	}
  	public void stop(){
    	myPointDirection = Math.random()*360;
    	myDirectionX = myDirectionY = 0;
  	}	
}
