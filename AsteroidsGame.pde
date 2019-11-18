Spaceship s;
Asteroid a;
boolean strobeVal,hopOn;
ArrayList<Star> cosmos;
ArrayList<Floater> floaties;
ArrayList<Bullet> shots;
boolean gameOver;
public void setup() 
{
	hopOn = false;
	strobeVal = false;
	gameOver = false;
	shots = new ArrayList<Bullet>();
	cosmos = new ArrayList<Star>();
	for(int i = 0;i<50;i++)
	{
		cosmos.add(new Star((float)Math.random()*500,(float)Math.random()*500));
	}
	s = new Spaceship();
	floaties = new ArrayList<Floater>();
	floaties.add(s);
	for(int i = 1; i<11;i++)
	{
		Asteroid a = new Asteroid();
		floaties.add(a);
		a.place();
	}
	size(500,500);
	background(0);
}
public void colCheck()
{
	for(Bullet b : shots)
	{
		for(int i = 1;i<floaties.size();i++)
		{
			if(dist((float)b.getX(),(float)b.getY(),(float)floaties.get(i).getX(),(float)floaties.get(i).getY())<20)
			{
				fill(255,0,0);
				stroke(255,0,0);
				ellipse((float)b.getX(),(float)b.getY(),50,50);
				floaties.remove(i);
				b.removeThis();
			}
		}
	}
	for(int i = 0;i<shots.size();i++)
	{
		shots.get(i).removeSelf(shots);
	}
}
public void reset()
{
	shots.clear();
	floaties.clear();
	gameOver = false;
	s.stop();
	s.setX(0);
	s.setY(0);
	s.setDirection(0);
	floaties.add(s);
	for(int i = 0;i<50;i++)
	{
		cosmos.add(new Star((float)Math.random()*500,(float)Math.random()*500));
	}
	for(int i = 1; i<11;i++)
	{
		Asteroid a = new Asteroid();
		floaties.add(a);
		a.place();
	}

}
public void loseCheck()
{
	for(int i = 1;i<floaties.size();i++)
	{
		if(dist((float)floaties.get(i).getX(),(float)floaties.get(i).getY(),(float)s.getX(),(float)s.getY())<20)
		{
			floaties.clear();
			cosmos.clear();
			shots.clear();
			gameOver = true;
			background(0);
			textSize(20);
			fill(255,255,0);
			text("You lose!",200,250);
			text("Press r to reset",170,270);
		}
	}
}
public void winCheck()
{
	if(floaties.size()==1)
	{
		floaties.clear();
		cosmos.clear();
		shots.clear();
		gameOver = true;
		background(0);
		fill(255,255,0);
		textSize(20);
		text("You win!",200,250);
		text("Press r to reset",170,270);
	}
}
public void keyPressed()
{
	if(keyCode==16)
		hopOn = true;
	if(key=='a'||key=='A')
		s.turn(-10);
	if(key=='d'||key=='D')
		s.turn(10);
	if((key=='w'||key=='W')&&!gameOver)
	{
		if(!hopOn)
		{
		s.accelerate(.25);
		strobeVal = true;
		}
		else{
			s.hop();
		}
	}
	if((key==' '&&shots.size()<10)&&!gameOver){
		shots.add(new Bullet(s));
		s.accelerate(-.1);
	}
	if((key=='q'||key=='Q')&&!gameOver)
	{
		s.setX(Math.random()*450);
		s.setY(Math.random()*450);
		s.stop();
		background(255);
	}
	if((key=='r'||key=='R')&&gameOver)
		reset();
}
public void keyReleased()
{
	if(key=='W'||key=='w')
		strobeVal = false;
	if(keyCode==16)
		hopOn = false;
}

public void draw() 
{
	if(!gameOver) background(0);
	for(Star p : cosmos)
	{
		p.pulse();
		p.show();
	}
	for(Floater f : floaties)
	{
		f.move();
		f.show();
	}
	for(Bullet b : shots)
	{
		b.move();
		b.show();
	}
	colCheck();
	winCheck();
	loseCheck();
  	if(strobeVal)
		s.strobe();
}