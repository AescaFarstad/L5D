package net;

import haxe.io.Bytes;
import neko.Lib;
import neko.net.ThreadServer;
import sys.net.Socket;
import util.MiscUtil;

typedef Client = {
	var socket:Socket;
	var id:Int;
}

typedef Message = {
	var str:String;
}

class Server extends ThreadServer<Client, Message>
{	
	private var _connectedClients:Array<Client>;

	public function new() 
	{
		super();
		initVars();
		run("localhost", 27015);
	}
	
	function initVars():Void
	{
		_connectedClients = [];
		errorOutput = Sys.stderr();
	}
	
	override function clientConnected(socket:Socket):Client
	{
		socket.setFastSend(true);
		var client:Client = { id:MiscUtil.getUniqueID(), socket:socket };
		_connectedClients[_connectedClients.length] = client;
		Lib.println("New client connected: " + Std.string(client.id));
		return client;
	}

	override function clientDisconnected(client:Client)
	{
		_connectedClients.remove(client);
		Lib.println("New client disconnected: " + Std.string(client.id));
	}
	
	override function update() 
	{
		//_currentTimestamp = Sys.time();
		//_deltaTime = _currentTimestamp - _lastUpdateTimestamp;
		//_lastUpdateTimestamp = _currentTimestamp;
		//
		//if (_deltaTime > 0 && _connectedClients.length > 0)
		//{
			//for (client in _connectedClients)
				//client.socket.write( "SMTH" );
		//}
	}
	
	override function readClientMessage(client:Client, buffer:Bytes, position:Int, dataLength:Int)
	{
		// find out if there's a full message, and if so, how long it is.
		var complete = false;
		var cpos = position;
		while (cpos < (position + dataLength) && !complete)
		{
			//check for a period/full stop (i.e.:  "." ) to signify a complete message 
			complete = (buffer.get(cpos) == 46);
			cpos++;
		}

		// no full message
		if(!complete) return null;

		// got a full message, return it
		//trace([pos, cpos-pos]);
		var msg:String = buffer.getString(position, dataLength);		
		return {msg: {str:msg}, bytes:dataLength};
	}


	override function clientMessage(client:Client, msg:Message)
	{
		Lib.println(client.id + " sent: " + msg.str);
	}
	
}