Particle[] particles;
public void setup()
{
	background(0);
	size(600,600);
	particles = new Particle[300];
	for (int i=0; i<300; i++)
	{
		particles[i]=new NormalParticle();
	}
}
void draw()
{
		background(0);
	for (int i=0; i<300; i++)
	{
		particles[i].show();
		particles[i].move();
		particles[i].wrap();
	}

}
class NormalParticle implements Particle
{
	double x,y,speed,theta;
	color paint;
	NormalParticle()
	{
		x=300;
		y=300;
		speed=(Math.random()*4+1);
		theta=(Math.random()*Math.PI*2);
		paint=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	void move()
	{
		x=x+speed*cos((float)theta);
		y=y+speed*sin((float)theta);
	}
	void show()
	{
		noStroke();
		fill(paint);
		ellipse((float)(x),(float)(y),10,10);
	}
	void wrap()
	{
		if(x>600 || x<0 || y>600 || y<0)
		{
		x=300;
		y=300;
		speed=(Math.random()*4+1);
		theta=(Math.random()*Math.PI*2);
		}
	}
}
interface Particle
{
	public void show();
	public void move();
	public void wrap();
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

