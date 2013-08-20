# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = dwm.c
OBJ = ${SRC:.c=.o}

all: options dwm

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

dwm: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f dwm ${OBJ} dwm-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p dwm-${VERSION}
	@cp -R LICENSE Makefile README config.def.h config.mk \
		dwm.1 ${SRC} dwm-${VERSION}
	@tar -cf dwm-${VERSION}.tar dwm-${VERSION}
	@gzip dwm-${VERSION}.tar
	@rm -rf dwm-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f dwm ${DESTDIR}${PREFIX}/bin/dwm-desktop
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm-desktop
	@echo installing launcher wrapper to ${DESTDIR}${PREFIX}/bin
	@cp -f scripts/dwm-browser ${DESTDIR}${PREFIX}/bin/dwm-browser
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm-browser
	@sed -i "s|@@PREFIX@@|${PREFIX}|" ${DESTDIR}${PREFIX}/bin/dwm-browser
	@cp -f scripts/dwm-lock ${DESTDIR}${PREFIX}/bin/dwm-lock
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm-lock
	@sed -i "s|@@PREFIX@@|${PREFIX}|" ${DESTDIR}${PREFIX}/bin/dwm-lock
	@cp -f scripts/dwm-menu ${DESTDIR}${PREFIX}/bin/dwm-menu
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm-menu
	@sed -i "s|@@PREFIX@@|${PREFIX}|" ${DESTDIR}${PREFIX}/bin/dwm-menu
	@cp -f scripts/dwm-term ${DESTDIR}${PREFIX}/bin/dwm-term
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm-term
	@sed -i "s|@@PREFIX@@|${PREFIX}|" ${DESTDIR}${PREFIX}/bin/dwm-term
	@cp -f scripts/dmenu-user ${DESTDIR}${PREFIX}/bin/dmenu-user
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu-user
	@sed -i "s|@@CONFPREFIX@@|${CONFPREFIX}|" ${DESTDIR}${PREFIX}/bin/dmenu-user
	@sed -i "s|@@PREFIX@@|${PREFIX}|" ${DESTDIR}${PREFIX}/bin/dmenu-user
	@echo installing lib to ${DESTDIR}${PREFIX}/lib/dwm-desktop/
	@mkdir -p ${DESTDIR}${PREFIX}/lib/dwm-desktop/
	@cp scripts/lib/lib-dwm-desktop ${DESTDIR}${PREFIX}/lib/dwm-desktop/
	@sed -i "s|@@PREFIX@@|${CONFPREFIX}|" ${DESTDIR}${PREFIX}/lib/dwm-desktop/lib-dwm-desktop
	@echo installing configuration in ${DESTDIR}${CONFPREFIX}/etc/dwm-desktop/
	@mkdir -p ${DESTDIR}${CONFPREFIX}/etc/dwm-desktop/
	@cp config/dwm-desktop.conf ${DESTDIR}${CONFPREFIX}/etc/dwm-desktop/
	@cp config/dmenu-user ${DESTDIR}${CONFPREFIX}/etc/dwm-desktop/
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < dwm.1 > ${DESTDIR}${MANPREFIX}/man1/dwm-desktop.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/dwm.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm-desktop
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm-lock
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm-menu
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm-term
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm-browser
	@rm -rf ${DESTDIR}${PREFIX}/lib/dwm-desktop/
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/dwm-desktop.1

.PHONY: all options clean dist install uninstall
