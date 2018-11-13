gcc -O3 -shared -o hlib.hdll -std=c11 hlibLib/hlib.c -I/usr/local/include -lhl
mv hlib.hdll /usr/local/lib