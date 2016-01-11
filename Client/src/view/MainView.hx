package view;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import game.IInput;
import net.Client;

class MainView extends Sprite
{
	private var _client:Client;
	private var _world:World;
	private var agentPlane:Sprite;
	private var ag:Graphics;
	private var _input:IInput;

	public function new() 
	{
		super();		
	}
	
	public function load(world:World, input:IInput) 
	{
		_input = input;
		_world = world;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		agentPlane = new Sprite();
		addChild(agentPlane);
		ag = agentPlane.graphics;
		agentPlane.x = stage.stageWidth / 2;
		agentPlane.y = stage.stageHeight / 2;
		
		graphics.beginFill(0xf0f0ff);
		graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		graphics.endFill();
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		_input.onKeyPress(e.keyCode);
		
	}
	
	public function update(timePassed:Float):Void
	{
		ag.clear();
		for (i in _world.agents) 
		{
			if (Std.is(i, Animal))
			{
				ag.beginFill(0x55ff55);
				ag.drawCircle(i.x, i.y, i.size/2);
				ag.endFill();
			}
			else if (Std.is(i, Hunter))
			{
				ag.beginFill(0x5555ff);
				ag.drawRect(i.x - i.size/2, i.y - i.size/2, i.size, i.size);
				ag.endFill();				
			}
		}
	}
	
}