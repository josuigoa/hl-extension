package;

import hlib.HLib;

class Main {
    
    static public function main() {
        
        HLib.helloName('hlib');
        HLib.requestResult('Josu', 1985, 2018);
        
        trace('Result managed in C side / name: ' + HLib.getName());
        trace('Result managed in C side / age: ' + HLib.getAge());
        
        // Invalid_argument("index out of bounds")
        var result:HLibResult = HLib.getHaxeObject('Josu', 1985, 2018);
        trace('Result managed in Haxe side / name: ' + result.name);
        trace('Result managed in Haxe side / age: ' + result.age);
        
    }
}