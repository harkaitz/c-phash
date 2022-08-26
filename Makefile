DESTDIR    =
PREFIX     =/usr/local
CC         =gcc
CFLAGS     =-Wall -g
PROGRAMS   =phash$(EXE)
HEADERS    =str/phash.h

## --------------------------------------------------------
all: $(PROGRAMS)
install: $(PROGRAMS) $(HEADERS)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS)  $(DESTDIR)$(PREFIX)/include/str
clean:
	rm -f $(PROGRAMS)

## ---------------------------------------------------------
phash$(EXE): tools/phash.c str/phash.h
	$(CC) -o $@ tools/phash.c $(CFLAGS)

## -- manpages --
ifneq ($(PREFIX),)
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
endif
## -- manpages --
## -- license --
ifneq ($(PREFIX),)
install: install-license
install-license: LICENSE
	@echo 'I share/doc/c-phash/LICENSE'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-phash
	@cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-phash
endif
## -- license --
