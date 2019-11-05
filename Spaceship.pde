class Spaceship extends Floater  
{   
	public Spaceship(){
    corners = 3;
    xCorners = new int[] {20,-20,-20};
    yCorners = new int[] {0,10,-10};
    myColor = color(255,0,255);
    myPointDirection = 0;
    myCenterX = 0;
    myCenterY = 0;
	}
	public void show(){
		super.show();
		noFill();
		stroke(255,0,255,127);
		ellipse((float)myCenterX,(float)myCenterY,40.0,40.0);
	}

}
