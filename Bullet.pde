class Bullet extends Floater{
	private boolean toRemove;
	public Bullet(Spaceship s){
		toRemove = false;
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
	public void removeThis(){
		toRemove = true;
	}
	public void removeSelf(ArrayList myList){
		if(myCenterX>500||myCenterX<0||myCenterY>500||myCenterY<0||toRemove){
			myList.remove(this);
		}
	}
}