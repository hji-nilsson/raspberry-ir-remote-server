CC=gcc
CFLAGS=-g -Wall -pedantic
LDLIBS=-llirc -llirc_client
LDFLAGS=-L/usr/lib/arm-linux-gnueabihf/
BIN=ir_server
BUILDDIR=./build

SRC=$(wildcard *.c)
OBJ=$(SRC:%.c=$(BUILDDIR)/%.o)

all: $(OBJ)
	$(CC) $^ $(LDFLAGS) $(LDLIBS) -o $(BUILDDIR)/$(BIN)

$(BUILDDIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -r -f $(BUILDDIR)

