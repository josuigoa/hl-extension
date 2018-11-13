package hlib;
	
/*

https://github.com/HaxeFoundation/hashlink/issues/161


You shouldn't try to wrap your dynobj as virtuals on the C side, instead let the Haxe compiler do that for you.
That means that your C binding on Haxe side should return Dynamic instead of {field:Int...}.
If you still want to be able to have structures on Haxe side, you can use the following:

abstract Dyn<T>(Dynamic) from T to T {
}
...
typedef Point = { x : Int, y : Int };
@:hlNative("openfl","fun") static function getPos() : Dyn<Point> { return null; }

*/

abstract Dyn<T>(Dynamic) from T to T {}

typedef HLibResult = {
	var name:String;
	var age:Int;
}

private typedef HLibResultHandler = hl.Abstract<"hlib_result">;
@:hlNative("hlib")
private class CLib
{
	public static function helloName( name:hl.Bytes ) : Null<hl.Bytes> { return null; }
	public static function requestResult( name:hl.Bytes, birthYear:Int, currentYear:Int ) : HLibResultHandler { return null; }
	public static function getHaxeObject( name:hl.Bytes, birthYear:Int, currentYear:Int ) : Dyn<HLibResult> { return null; }
	public static function resultName( result:HLibResultHandler ) : Null<hl.Bytes> { return null; }
	public static function resultAge( result:HLibResultHandler ) : Int { return 0; }
}

@:access(String)
class HLib {
	
	static var result:HLibResultHandler;

	public function new() {}
	
	static public function helloName( name : String ) {
		var bytes = CLib.helloName(name.bytes);
		
		if ( bytes == null )
			return null;
		
		var text = String.fromUCS2(bytes);
		
		trace('returned text: $text');
		
		return text;
	}
	
	static public function requestResult( name : String, birthYear : Int, currentYear : Int ) {
		result = CLib.requestResult(name.bytes, birthYear, currentYear);
	}
	
	static public function getName() {
		if (result == null) return '';
		
		return String.fromUCS2(CLib.resultName(result));
	}
	
	static public function getAge() {
		if (result == null) return 0;
		
		return CLib.resultAge(result);
	}
	
	static public function getHaxeObject( name : String, birthYear : Int, currentYear : Int ) : HLibResult {
		// Segmentation fault 11
		// this error raises when casting occurs
		return CLib.getHaxeObject(name.bytes, birthYear, currentYear);

		// requestResult(name, birthYear, currentYear);
		// var res:HLibResult = {name : getName(), age : getAge()};
		// return res;
	}
	
}