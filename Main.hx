package;

import hlib.HLib;

class Main {
    
    static public function main() {
        
        trace('HLib.helloName: ' + HLib.helloName('hlib'));

        var d = Date.now();

        var inst = new HLib('Josu', 1985, d.getFullYear());
        trace('Result managed in C side / name: ' + inst.getName());
        trace('Result managed in C side / age: ' + inst.getAge());
        
    }
}