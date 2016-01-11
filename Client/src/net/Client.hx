package net;
import flash.errors.SecurityError;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.Socket;

class Client
{

	static private var _socket:Socket;
	
	public function new() 
	{		
		_socket = new Socket();
		_socket.addEventListener(Event.CONNECT, onConnected);
		_socket.addEventListener(ProgressEvent.SOCKET_DATA, onData);
		_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		_socket.addEventListener(IOErrorEvent.IO_ERROR, onError);
		_socket.addEventListener(Event.CLOSE, onClosed);
	}
	
	private function onSecurityError(e:SecurityErrorEvent):Void 
	{
		trace("Socket Error " + Std.string(e.errorID) + " " + e.text);				
	}
	
	private function onClosed(e:Event):Void 
	{
		trace("SocketClosed");
	}
	
	private function onError(e:IOErrorEvent):Void 
	{
		trace("Socket Error " + Std.string(e.errorID) + " " + e.text);		
	}
	
	private function onData(e:ProgressEvent):Void 
	{
		e.
		trace("some data received");
	}
	
	private function onConnected(e:Event):Void 
	{
		trace("Socket connected");
	}
	
	public function load() 
	{
		_socket.connect("localhost", 27015);		
	}
	
	public function send(string:String) :Void
	{
		if (!_socket.connected)
		{
			trace("failed to send data");
			return;
		}
		_socket.writeUTFBytes(string + ".");
		_socket.flush();
	}
	
}