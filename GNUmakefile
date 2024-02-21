PROJECT  =c-phash
VERSION  =1.0.0
DESTDIR  =
PREFIX   =/usr/local
CC       =gcc -pedantic-errors -std=c99 -Wall
PROGRAMS =phash$(EXE)
HEADERS  =str/phash.h
##
all: $(PROGRAMS)
install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS)  $(DESTDIR)$(PREFIX)/include/str
clean:
	rm -f $(PROGRAMS)
phash$(EXE): tools/phash.c str/phash.h
	$(CC) -o $@ tools/phash.c $(CFLAGS)
## -- BLOCK:license --
install: install-license
install-license: 
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE  $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
## -- BLOCK:license --
## -- BLOCK:man --
install: install-man
install-man:
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp ./doc/phash.1 $(DESTDIR)$(PREFIX)/share/man/man1
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/phash.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
