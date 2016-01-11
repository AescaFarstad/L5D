package game;
import flash.geom.Point;
import flash.ui.Keyboard;

class DirectInput implements IInput
{
	public var world:World;

	public function new() 
	{
		
	}
	
	public function load(world:World):Void
	{
		this.world = world;
		
	}	
	
	public function onKeyPress(code:UInt):Void 
	{
		if (code == Keyboard.W)
		{
			world.moveHunter(new Point(0, -1));
		}
		if (code == Keyboard.A)
		{
			world.moveHunter(new Point(-1, 0));
		}
		if (code == Keyboard.S)
		{
			world.moveHunter(new Point(0, 1));
		}
		if (code == Keyboard.D)
		{
			world.moveHunter(new Point(1, 0));
		}
		
	}
	
}