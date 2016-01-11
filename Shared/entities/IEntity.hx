package entities;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;

interface IEntity
{
	
	public function serialize(buffer:BytesBuffer):Void 
	{
		
	}
	
	public function deserialize(bytes:BytesInput):Void 
	{
		
	}
	
	public function clone():IEntity
	{
		
	}
}