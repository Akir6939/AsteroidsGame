Spaceship s;
Asteroid a;
boolean strobeVal;
ArrayList<Star> cosmos;
ArrayList<Floater> floaties;
public void setup() 
{
	strobeVal = false;
	cosmos = new ArrayList<Star>();
	for(int i = 0;i<50;i++){
		cosmos.add(new Star((float)Math.random()*500,(float)Math.random()*500));
	}
	s = new Spaceship();
	floaties = new ArrayList<Floater>();
	floaties.add(s);
	for(int i = 1; i<11;i++){
		Asteroid a = new Asteroid();
		floaties.add(a);
		a.place();
	}
	size(500,500);
	background(0);
}
public void keyPressed(){
	if(key=='a'||key=='A')
		s.turn(-10);
	if(key=='d'||key=='D')
		s.turn(10);
	if(key=='w'||key=='W'){
		s.accelerate(.25);
		strobeVal = true;
	}
	if(key=='h'||key=='H'){
		s.setX(Math.random()*450);
		s.setY(Math.random()*450);
		s.stop();
		background(255);
	}
}
public void keyReleased(){
	if(key=='W'||key=='w')
		strobeVal = false;
}

public void draw() 
{
	background(0);
	for(Star p : cosmos)
		p.show();
	for(Floater f : floaties){
		f.move();
		f.show();
	}
  	if(strobeVal)
		s.strobe();
}

