CC=gcc
CFLAGS=-Wall

transpose: transpose.o
	$(CC) -o transpose transpose.o $(CFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f *.o transpose