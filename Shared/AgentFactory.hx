package;

class AgentFactory
{

	public function new() 
	{
		
	}
	
	static public function createAgent(type:Int):Agent
	{
		if (type == 0)
			return new Animal();
		else if (type == 1)
			return new Hunter();
		return null;
	}
}