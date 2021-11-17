IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR) -Wall

ODIR=obj
LDIR=./lib
SDIR=./src

TARGET=./bin/out

LIBS=-lSDL2 -lSDL2main -lm

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS) -g

$(TARGET): $(patsubst %,$(ODIR)/%,*)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: run test debug clean

run:
	$(TARGET)

test:
	make && make run

debug:
	make && gdb bin/out

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
