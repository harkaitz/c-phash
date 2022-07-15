DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROG_PHASH =phash$(EXE)

all: $(PROG_PHASH)
$(PROG_PHASH): tools/phash.c str/phash.h
	$(CC) -o $@ tools/phash.c $(CFLAGS)
install: $(PROG_PHASH) str/phash.h
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROG_PHASH) $(DESTDIR)$(PREFIX)/bin
	cp str/phash.h $(DESTDIR)$(PREFIX)/include/str
clean:
	rm -f $(PROG_PHASH)
## -- manpages --
MAN_1=./doc/phash.1 
install: install-man1
install-man1: $(MAN_1)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp $(MAN_1) $(DESTDIR)$(PREFIX)/share/man/man1
MAN_3=./doc/phash.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-phash
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-phash
## -- license --
