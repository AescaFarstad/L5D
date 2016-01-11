package;

class AgentState
{
	public var id:Int;
	public var x:Float;
	public var y:Float;
	public var type:Int;

	public function new(x:Float, y:Float, type:Int, id:Int = -1) 
	{
		this.id = id;
		this.type = type;
		this.y = y;
		this.x = x;
		
	}
	
}