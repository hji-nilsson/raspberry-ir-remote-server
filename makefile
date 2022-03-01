CC=gcc
CFLAGS=-g -Wall -pedantic
LDLIBS=
BIN=ir_server
BUILDDIR=./build

SRC=$(wildcard *.c)
OBJ=$(SRC:%.c=$(BUILDDIR)/%.o)

all: $(OBJ)
	$(CC) $^ $(LDLIBS) -o $(BUILDDIR)/$(BIN)

$(BUILDDIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -r -f $(BUILDDIR)

