class Bullet extends Floater{
	public Bullet(Spaceship s){
		myCenterX = s.getX();
		myCenterY = s.getY();
		myPointDirection = s.getDirection();
		double dRadians = myPointDirection*PI/180;
		myDirectionX = 5*Math.cos(dRadians)+s.getDirectionX();
		myDirectionY = 5*Math.sin(dRadians)+s.getDirectionY();
	}
	public void show(){
		ellipseMode(CENTER);
		fill(210,180,140);
		stroke(210,180,140);
		ellipse((float)myCenterX,(float)myCenterY,10,10);
	}
	public void move(){
		myCenterX+=myDirectionX;
		myCenterY+=myDirectionY;
	}
}