# HashLink Extension

This library is created to learn how the bridge between Haxe and C works. It only has few functions:

* HLExt.new(name:String, birthYear:Int, currentYear:Int): Creates an `struct` in C side with given arguments, returns that struct and we save it in the Haxe side.

```c
struct _result {
    vbyte *greeting;
    int age;
};
```

* HLExt.getGreeting(): Get the name from C struct.
* HLExt.getAge(): Get the age from C struct.
* static HLExt.getHaxeObject(name:String, birthYear:Int, currentYear:Int): returns a Haxe object instead of a pointer to C side.

## Compiling HDLL file

To create the *.hdll file execute this command:

`gcc -O3 -shared -o hlext.hdll -std=c11 hlextLib/hlext.c -I/usr/local/include -lhl`

* **gcc**: compiler call
* **-O3**: level 3 optimization
* **-shared**: flag to tell this is a shared library
* **-o file.out**: define the output file
* **-std=standard**: C language standard
* **hlextLib/hlext.c**: C file to compile
* **-Idirectory**: Include the directory where headers files are. In this case only `hl.h` is needed
* **-llib**: Use `lib` library

Once we create the `hlext.hdll` file, move it where the other *.hdll files are. In may case they are at `/usr/local/lib`

`mv hlext.hdll /usr/local/lib`

## Usage

See `Main.hx`.

## TODO

* Try compiling with HLC.
* Try on Win / Linux.
* Add a callback to C side and then call to Haxe from C.