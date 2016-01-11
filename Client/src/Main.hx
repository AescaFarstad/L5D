package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;
import flash.net.Socket;
import flash.utils.Function;
import game.DirectInput;
import game.IInput;
import net.Client;
import net.NetInput;
import view.MainView;

class Main 
{
	static private var _socket:Socket;
	static public var stage:flash.display.Stage;
	static public var world:World;
	static public var view:MainView;
	static public var lastUpdate:Float;
	static public var input:IInput;
	static public var updateWorld:Bool;
	
	static function main() 
	{
		stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// Entry point
		
		var client:Client = new Client();
		client.load();
		
		world = new World();
		view = new MainView();
		stage.addChild(view);
		
		//loadLocal(onDone);		
		loadRemote(onDone);	
	}
	
	static private function onDone() 
	{
		view.load(world, input);
		lastUpdate = Lib.getTimer() / 1000;		
		stage.addEventListener(Event.ENTER_FRAME, onFrame);		
	}
	
	static private function loadLocal():Void
	{
		world.load(new GameState(true));
		var directInput:DirectInput = new DirectInput();
		directInput.load(world);
		input = directInput;
		updateWorld = true;
	}
	
	static private function loadRemote(callback:Function):Void
	{
		client.requestGameState(onStateAquired);
	}
	
	static private function onStateAquired(state:GameState) 
	{
		world.load(state);
		var netInput:NetInput = new NetInput();
		netInput.load(client);
		input = netInput;
		updateWorld = false;		
	}
	
	static private function onFrame(e:Event):Void 
	{
		var time:Float = Lib.getTimer() / 1000;
		var diff:Float = time - lastUpdate;
		if (updateWorld)
			world.update(diff);
		view.update(diff);
	}
	
}