package;

class Animal extends Agent
{	
	static public var MAX_DISTANCE:Float = 300;
	
	public var speed:Float;
	public var angle:Float;
	public var turnSpeed:Float;
	

	public function new() 
	{
		super();
		x = 0;
		y = 0;
		size = 20;
		speed = 10;
		turnSpeed = Math.PI * 2 / 70;
		angle = Math.random() * Math.PI * 2;
	}
	
	override public function update(timePassed:Float):Void 
	{
		angle += (Math.random() - 0.5) * 2 * turnSpeed * timePassed;
		x += Math.cos(angle) * speed;
		y += Math.sin(angle) * speed;
		
		if (x * x + y * y > MAX_DISTANCE * MAX_DISTANCE)
			angle = Math.atan2( -y, -x);
	}
}