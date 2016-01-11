package entities;
import entities.IEntity;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.BytesInput;

class WorldEntity implements IEntity
{
	public var player:PlayerEntity;
	public var animal:AnimalEntity;
	public var time:Float;
	
	public function new(skipInit:Bool = false) 
	{
		if (!skipInit)
		{
			player = new PlayerEntity();
			animal = new AnimalEntity();
		}
	}
	
	/* INTERFACE entities.IEntity */
	
	public function serialize(buffer:BytesBuffer):Void 
	{
		player.serialize(buffer);
		animal.serialize(buffer);
		buffer.addDouble(time);
	}
	
	public function deserialize(bytes:BytesInput):Void 
	{
		player.deserialize(bytes);
		animal.deserialize(bytes);
		time = bytes.readDouble();
	}
	
	public function clone():IEntity 
	{
		var newEntity:WorldEntity = new WorldEntity(true);
		newEntity.player = player.clone();
		newEntity.animal = animal.clone();
		newEntity.time = time;
	}
	
}