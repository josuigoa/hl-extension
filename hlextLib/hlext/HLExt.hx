package hlext;

abstract Dyn<T>(Dynamic) from T to T {}

typedef HLExtResult = {
	var greeting:HString;
	var age:Int;
}

@:access(String)
@:forward
abstract HString(String) from String to String {
	@:from static public inline function fromBytes(b:hl.Bytes):HString
		return switch b {
					case null: null;
					default: String.fromUCS2(b);
			}
	
	@:to public inline function toBytes():hl.Bytes
		return switch this {
					case null: null;
					default: this.bytes;
			}
}

private typedef HLExtResultHandler = hl.Abstract<"hlext_result">;
@:hlNative("hlext")
private class CLib
{
	public static function requestResult( name:hl.Bytes, birthYear:Int, currentYear:Int ) : HLExtResultHandler { return null; }
	public static function resultGreeting( result:HLExtResultHandler ) : Null<hl.Bytes> { return null; }
	public static function resultAge( result:HLExtResultHandler ) : Int { return 0; }
	public static function requestAsyncValue ( cb:String->Void, seconds:Int ) : Void { };
	public static function getHaxeObject( name:hl.Bytes, birthYear:Int, currentYear:Int ) : Dyn<{greeting:hl.Bytes, age:Int}> { return null; }
}

class HLExt {
	
	static var result:HLExtResultHandler;

	public function new(name : HString, birthYear : Int, currentYear : Int) {
		result = CLib.requestResult(name, birthYear, currentYear);
	}
	
	public function getGreeting():HString {
		if (result == null) return '';
		
		return CLib.resultGreeting(result);
	}
	
	public function getAge() {
		if (result == null) return 0;
		
		return CLib.resultAge(result);
	}
	
	public function requestAsyncValue( callback : String->Void, seconds : Int ) {
		CLib.requestAsyncValue(callback, 5);
	}
	
	static public function getHaxeObject( name : HString, birthYear : Int, currentYear : Int ) : HLExtResult {
		var r:{greeting:hl.Bytes, age:Int} = CLib.getHaxeObject(name, birthYear, currentYear);
		var hlextResult:HLExtResult = {greeting : r.greeting, age : r.age};
		return hlextResult;
	}
	
}