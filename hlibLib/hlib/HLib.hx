package hlib;

abstract HString(String) from String to String {
	@:from static public inline function fromBytes(b:hl.Bytes):HString
		return switch b {
					case null: null;
					default: @:privateAccess String.fromUCS2(b);
		}
}

private typedef HLibResultHandler = hl.Abstract<"hlib_result">;
@:hlNative("hlib")
private class CLib
{
	public static function helloName( name:hl.Bytes ) : Null<hl.Bytes> { return null; }
	public static function requestResult( name:hl.Bytes, birthYear:Int, currentYear:Int ) : HLibResultHandler { return null; }
	public static function resultName( result:HLibResultHandler ) : Null<hl.Bytes> { return null; }
	public static function resultAge( result:HLibResultHandler ) : Int { return 0; }
}

@:access(String)
class HLib {
	
	static var result:HLibResultHandler;

	public function new( name : String, birthYear : Int, currentYear : Int ) {
		result = CLib.requestResult(name.bytes, birthYear, currentYear);
	}
	
	public function getName():HString {
		return CLib.resultName(result);
	}
	
	public function getAge() {
		if (result == null) return 0;
		
		return CLib.resultAge(result);
	}
	
	static public function helloName( name : String ):HString {
		return CLib.helloName(name.bytes);
	}
}