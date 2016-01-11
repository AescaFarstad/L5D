package entities;

class AnimalEntity extends AgentEntity
{

	public function new() 
	{
		super();
		
	}
	
	override public function clone():IEntity 
	{
		var newEntity:AnimalEntity = new AnimalEntity();
		copyProperties(newEntity);
	}
	
}