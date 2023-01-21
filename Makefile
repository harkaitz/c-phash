DESTDIR    =
PREFIX     =/usr/local
CC         =cc
CFLAGS     =-Wall -g
PROGRAMS   =phash$(EXE)
HEADERS    =str/phash.h
## -- targets
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(HEADERS)  $(DESTDIR)$(PREFIX)/include/str
clean:
	rm -f $(PROGRAMS)
## -- program
phash$(EXE): tools/phash.c str/phash.h
	@echo "B $@ $^"
	@$(CC) -o $@ tools/phash.c $(CFLAGS)
## -- manpages --
install: install-man1
install-man1:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp ./doc/phash.1 $(DESTDIR)$(PREFIX)/share/man/man1
install: install-man3
install-man3:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/phash.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-phash
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-phash
## -- license --
