
binary: main.o libworld.so
	gcc -o binary main.o -L. -lworld -Wl,-rpath,.

main.o: main.c
	gcc -c main.c

libworld.so: hello_w.o goodbye_w.o
	gcc -shared -o libworld.so hello_w.o goodbye_w.o

hello_w.o: hello_w.c
	gcc -c -fPIC hello_w.c

goodbye_w.o: goodbye_w.c
	gcc -c -fPIC goodbye_w.c

clean:
	rm -f *.o *.so binary
