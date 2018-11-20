package;

import hlext.HLExt;

class Main {
    
    static public function main() {
        
        var d = Date.now();
        var inst = new HLExt('HashLink', 2015, d.getFullYear());

        trace('Result managed in C side / greeting: ' + inst.getGreeting());
        trace('Result managed in C side / age: ' + inst.getAge());
        
        var result:HLExtResult = HLExt.getHaxeObject('Josu', 1985, d.getFullYear());
        trace('Result managed in Haxe side / greeting: ' + result.greeting);
        trace('Result managed in Haxe side / age: ' + result.age);
        
    }
}