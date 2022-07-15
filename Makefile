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
install: install-man
install-man: ./doc/phash.1.md ./doc/phash.3.md 
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp ./doc/phash.1 $(DESTDIR)$(PREFIX)/share/man/man1
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/phash.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/c-phash
	cp LICENSE $(DESTDIR)$(PREFIX)/share/c-phash
## -- license --
