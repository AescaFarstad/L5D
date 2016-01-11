package net;

import game.IInput;

class NetInput implements IInput
{
	public var client:Client;

	public function new() 
	{
		
	}
	
	public function load(client:Client):Void
	{
		this.client = client;		
	}
	
	
	public function onKeyPress(code:Int):Void 
	{
		client.send(Std.string(code) + ".");
	}
	
}