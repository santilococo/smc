CC = gcc
CFLAGS = -mmacosx-version-min=10.4  -Wall -g -framework IOKit
CPPFLAGS = -DCMD_TOOL_BUILD
PREFIX ?= /usr/local
DESTDIR = $(PREFIX)/bin

all: smc 

smc: smc.o
	$(CC) $(CFLAGS) -o smc smc.o

smc.o: smc.h smc.c
	$(CC) $(CPPFLAGS) -c smc.c

install: smc
	install -d $(DESTDIR)
	install -m 755 smc $(DESTDIR)

uninstall:
	rm -f $(DESTDIR)/smc

clean:
	-rm -f smc smc.o
