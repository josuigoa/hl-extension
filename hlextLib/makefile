HLPATH=
CC=gcc
CFLAGS=-Wall -O3 -I. -std=c11
HDLLPATH=

UNAME := $(shell uname)

ifeq ($(OS),Windows_NT)

RELEASE_NAME=win
HLPATH=../../hl17win/include

ifeq ($(ARCH),32)
CC=i686-pc-cygwin-gcc
endif

else ifeq ($(UNAME),Darwin)
RELEASE_NAME=osx
HLPATH=/usr/local/include
HDLLPATH=/usr/local/lib
else
RELEASE_NAME=linux
HLPATH=/usr/local/include
endif

CFLAGS += -I${HLPATH}
# hlext_win: hlext.c
# 	cl /ohlext.hdll /LD /EHsc /I $(HLPATH) /DYNAMICBASE libhl.lib hlext.c
	
hlext.hdll: hlext.c
	gcc -o hlext.hdll hlext.c -shared ${CFLAGS} -lhl
	mv hlext.hdll ${HDLLPATH}