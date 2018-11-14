# HashLink Extension

This library is created to learn how the bridge between Haxe and C works. It only has few functions:

* HLib.helloName(name:String): Sends a Haxe String to C and gets back a greeting.
* HLib.requestResult(name:String, birthYear:Int, currentYear:Int): Creates an `struct` in C side with given arguments

```c
struct _result {
    vbyte *name;
    int age;
};
```

* HLib.getName(): Get the name from C struct. To call this method it's necessary to call HLib.requestResult first.
* HLib.getAge(): Get the age from C struct. To call this method it's necessary to call HLib.requestResult first.

## Compiling HDLL file

To create the *.hdll file execute this command:

`gcc -O3 -shared -o hlib.hdll -std=c11 hlibLib/hlib.c -I/usr/local/include -lhl`

* **gcc**: compiler call
* **-O3**: level 3 optimization
* **-shared**: flag to tell this is a shared library
* **-o file.out**: define the output file
* **-std=standard**: C language standard
* **hlibLib/hlib.c**: C file to compile
* **-Idirectory**: Include the directory where headers files are. In this case only `hl.h` is needed
* **-llib**: Use `lib` library

Once we create the `hlib.hdll` file, move it where the other *.hdll files are. In may case they are at `/usr/local/lib`

`mv hlib.hdll /usr/local/lib`

## Usage

See `Main.hx`.

## TODO

* Try compiling with HLC.
* Try on Win / Linux.
* Add a callback to C side and then call to Haxe from C.