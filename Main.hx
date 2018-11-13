package;

import hlib.HLib;

class Main {
    
    static public function main() {
        
        HLib.helloName('hlib');

        var d = Date.now();

        HLib.requestResult('Josu', 1985, d.getFullYear());
        trace('Result managed in C side / name: ' + HLib.getName());
        trace('Result managed in C side / age: ' + HLib.getAge());
        
        var result:HLibResult = HLib.getHaxeObject('Josu', 1985, d.getFullYear());
        trace('Result managed in Haxe side / name: ' + result.name);
        trace('Result managed in Haxe side / age: ' + result.age);
        
    }
}