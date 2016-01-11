package;

class GameState
{
	public var agentStates:Array<AgentState>;
	
	public function new(initWithDefault:Bool) 
	{
		if (initWithDefault)
		{
			agentStates = [];
			agentStates.push(new AgentState(100, 100, 0));
			agentStates.push(new AgentState(0, 0, 1));
		}
	}
	
}