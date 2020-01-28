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

There are two Docker images (Windows and Linux) with the tools required for the compilation. Run the docker container for the desired OS and attach to it;

* ```docker-compose up --build linux``` -> Attach to the container ```docker run -it [container_id] /bin/sh```
* ```docker-compose up --build win``` -> Attach to the container ```docker run -it [container_id] powershell```

Go to the ```makefile.*``` path and execute:

* linux | mac: ```make -f makefile.[linux|mac]```
  * move the newly created  ```hlext.hdll``` to the path where ```libhl.so``` is, usualy ```/usr/local/lib```
* win: ```nmake -f makefile.win```
  * rename ```hlext.dll``` to ```hlext.hdll``` and move it to the path where ```libhl.lib``` is.

To create the *.hdll file execute this command:

## Commands breakdown

### Linux and mac

```shell
gcc -O3 -shared -o hlext.hdll -std=c11 hlext.c -I/usr/local/include -lhl
```

* **gcc**: compiler call
* **-O3**: level 3 optimization
* **-shared**: flag to tell this is a shared library
* **-o file.out**: define the output file
* **-std=standard**: C language standard
* **hlextLib/hlext.c**: C file to compile
* **-Idirectory**: Include the directory where headers files are. In this case only `hl.h` is needed
* **-lname**: Use `libname` library
* **-fPIC**: Position Independent Code

### Windows

TODO

## Usage

See `Main.hx`.

## TODO

* Try compiling with HLC.
* Add a callback to C side and then call to Haxe from C.
