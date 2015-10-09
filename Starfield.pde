Particle[] particles;
int partSize=5;
int xdir=1;
int ydir=1;
public void setup()
{
	background(100);
	size(600,600);
	particles = new Particle[300];
	for (int i=0; i<300; i++)
	{
		particles[i]=new NormalParticle();
	}
	particles[0]=new OddballParticle();
	particles[1]=new JumboParticle();
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
		speed=(Math.random()*1+.5);
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
		ellipse((float)(x),(float)(y),partSize,partSize);
	}
	void wrap()
	{
		if(x>650 || x<-50 || y>650 || y<-50)
		{
		x=300;
		y=300;
		//speed=(Math.random()*2+1);
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
class OddballParticle implements Particle
{
double x,y,speed,theta;
	color paint;
	OddballParticle()
	{
		x=300;
		y=300;
		speed=3;
		theta=(Math.random()*Math.PI*2);
		paint=color(255,255,255);
	}
	void move()
	{

		x=x+speed*xdir*cos((float)theta);
		y=y+speed*ydir*sin((float)theta);
		
	}
	void show()
	{
		noStroke();
		fill(paint);
		ellipse((float)(x),(float)(y),15,15);
	}
	void wrap() 
	{
		if(x>600 || x<0)
		{
			xdir=-xdir;
		}
		else if (y>600 || y<0)
		{
			ydir=-ydir;
		}
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	void show()
	{
		fill(paint);
		ellipse((float)(x),(float)(y),partSize*10,partSize*10);
	}
}

