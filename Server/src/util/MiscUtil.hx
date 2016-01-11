package util;

class MiscUtil
{
	static private var _idCount:Int = 0;
	
	public function new() 
	{
		
	}
	
	static public function getUniqueID():Int
	{
		return _idCount++;
	}
	
}