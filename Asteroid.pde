class Asteroid extends Floater
{
	private int rotSpeed;
	public Asteroid()
	{
		rotSpeed = (int)(Math.random()*16)-8;
		corners = 4;
		xCorners = new int[]{10,-10,-10,10};
		yCorners = new int[]{10,10,-10,-10};
		myCenterX = myCenterY = 0;
		myPointDirection = Math.random()*360;
		myColor = color(165,150,146);
		myDirectionX = Math.cos(myPointDirection*PI/180)*2;
		myDirectionY = Math.sin(myPointDirection*PI/180)*2;
	}
	public void move()
	{
		turn(rotSpeed);
		super.move();
	}
	public void place()
	{
		myCenterX = Math.random()*500;
		myCenterY = Math.random()*500;
	}
}