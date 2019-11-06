Spaceship s;
ArrayList<Star> cosmos;
public void setup() 
{
	cosmos = new ArrayList<Star>();
	for(int i = 0;i<50;i++){
		cosmos.add(new Star((float)Math.random()*500,(float)Math.random()*500));
	}
	size(500,500);
	background(0);
  	s = new Spaceship();
}
public void keyPressed(){
	if(key=='a'||key=='A')
		s.turn(-10);
	if(key=='d'||key=='D')
		s.turn(10);
	if(key=='w'||key=='W'){
		s.accelerate(.25);
		s.strobe();
	}
	if(key=='h'||key=='H'){
		s.setX(Math.random()*450);
		s.setY(Math.random()*450);
		s.stop();
		background(255);
	}

}
public void draw() 
{
	background(0);
	for(Star p : cosmos)
		p.show();
	s.move();
  	s.show();
}

