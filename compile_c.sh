gcc main.c -v -o main.exe -std=c11 -O3 -I. -I../hl17win/include -I/path/to/hl-extension/hlibLib -L../hl17win -llibhl
# gcc main.c -v -o main.exe -std=c11 -O3 -I./ -I./hl170win/include -L./hl170win -llibhl
# https://github.com/HaxeFoundation/hashlink/issues/86
# gcc -o hello -D INCLUDE_ALL -I out -I camicLib  -I hashlink/src  -std=c11 out/main.c -lhl


# https://www.rapidtables.com/code/linux/gcc.html#options
# http://tigcc.ticalc.org/doc/comopts.html
# -O3 -> level 3 optimization
# -o -> output
# -std=standard -> language standard
# -I dir -> include dir for header files
# -Ldir -> Add directory dir to the list of directories to be searched for '-l'. '-l' links with a library file

# gcc camic.c -O3 -shared -o camic.hdll -std=c11
# gcc -O3 -shared -o camic.hdll -std=c11 camic.c -IC:\josu\haxetoolkit\hl17win\include -lhl -LC:\josu\haxetoolkit\hl17win\

# C:\josu\haxetoolkit\out> gcc main.c -v -o main.exe -std=c11 -O3 -I. -I../hl17win/include -I../camicLib -L../h17win/ -lhl


# https://github.com/HaxeFoundation/hashlink/issues/124
# nm ..\hl17win\libhl.lib | grep __imp_hl_alloc_init
# nm ..\hl17win\libhl.lib > nm.txt


# ADIBIDEA
UI = libs/ui/ui_stub.o
CC=i686-pc-cygwin-gcc
CFLAGS = -Wall -O3 -I src -msse2 -mfpmath=sse -std=c11 -I include/pcre -I include/mikktspace -D LIBHL_EXPORTS
LIBFLAGS = -Lxxx -Lyyy

ui: ${UI} libhl
    ${CC} ${CFLAGS} -shared -o ui.hdll ${UI} ${LIBFLAGS} -L. -lhl


# AZALPENA
myprogram.exe: myprogram.o
    $(CC) -o myprogram.exe myprogram.o

myprogram.o: myprogram.cpp
    $(CC) -c myprogram.cpp

The first line says that "myprogram.exe" depends on "myprogram.o". The second line tells how to create myprogram.exe from myprogram.o. The third and fourth lines say myprogram.o depends on myprogram.cpp, and how to create myprogram.o from myprogram.cpp (respectively).