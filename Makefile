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
install: install-man1
install-man1:
	@echo 'I share/man/man1/'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	@echo 'I share/man/man1/phash.1'
	@cp ./doc/phash.1 $(DESTDIR)$(PREFIX)/share/man/man1
install: install-man3
install-man3:
	@echo 'I share/man/man3/'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	@echo 'I share/man/man3/phash.3'
	@cp ./doc/phash.3 $(DESTDIR)$(PREFIX)/share/man/man3
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
