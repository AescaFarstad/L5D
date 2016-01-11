package entities;
import entities.IEntity;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.BytesInput;

class AgentEntity implements IEntity
{
	public var x:Float;
	public var y:Float;
	
	
	public function new() 
	{
		
	}
	
	/* INTERFACE entities.IEntity */
	
	public function serialize(buffer:BytesBuffer):Void 
	{
		buffer.addDouble(x);
		buffer.addDouble(y);
	}
	
	public function deserialize(bytes:BytesInput):Void 
	{
		x = bytes.readDouble();
		y = bytes.readDouble();
	}
	
	public function clone():IEntity 
	{
		return null;
	}
	
	private function copyProperties(entity:AgentEntity):Void 
	{
		entity.x = x;
		entity.y = y;
	}
}