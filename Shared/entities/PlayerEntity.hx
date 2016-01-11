package entities;
import entities.IEntity;

class PlayerEntity extends AgentEntity
{

	public function new() 
	{
		super();
		
	}
	
	override public function clone():IEntity 
	{
		var newEntity:PlayerEntity = new PlayerEntity();
		copyProperties(newEntity);
	}
	
}