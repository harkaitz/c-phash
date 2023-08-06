PROJECT  =c-phash
VERSION  =1.0.0
DESTDIR  =
PREFIX   =/usr/local
CC       =cc
CFLAGS   =-Wall -g
PROGRAMS =phash$(EXE)
HEADERS  =str/phash.h
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
## -- BLOCK:license --
install: install-license
install-license: 
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE README.md $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
update: update-license
update-license:
	ssnip README.md
## -- BLOCK:license --
## -- BLOCK:man --
update: update-man
update-man:
	make-h-man update
install: install-man
install-man:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp ./doc/phash.1 $(DESTDIR)$(PREFIX)/share/man/man1
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./doc/phash.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
