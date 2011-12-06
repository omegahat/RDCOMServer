include VersionInfo

PKG_FILES=$(shell find R examples src man -not -path '*CVS*' -not -name '*~') DESCRIPTION

PACKAGE_DIR=$(RHOME)/src/library
PACKAGE_DIR=/tmp
INSTALL_DIR=${PACKAGE_DIR}/$(PKG_NAME)

include Install/GNUmakefile.admin

C_SOURCE=$(wildcard src/*.[ch] src/*.cpp) src/exports.def src/RCOMServer.def
#src/Makefile.win 
R_SOURCE=$(wildcard R/*.[RS]) R/namedFunctions.S
MAN_FILES=$(wildcard man/*.Rd)
INSTALL_DIRS=src man R

DOCS=Docs/UserGuide.html Docs/UserGuide.xml Docs/Paradigm.html Docs/Paradigm.xml \
	Todo.html Install/FAQ.html Changes.html README

DESCRIPTION: DESCRIPTION.in Install/configureInstall.in VersionInfo

package: DESCRIPTION R/namedFunctions.S  $(DOCS)
#	@if test -z "${RHOME}" ; then echo "You must specify RHOME" ; exit 1 ; fi
	if test -d $(INSTALL_DIR) ; then rm -fr $(INSTALL_DIR) ; fi
	mkdir $(INSTALL_DIR)
	cp NAMESPACE DESCRIPTION $(INSTALL_DIR)
	for i in $(INSTALL_DIRS) ; do \
	   mkdir $(INSTALL_DIR)/$$i ; \
	done
	cp -r $(C_SOURCE) $(INSTALL_DIR)/src
	cp src/GNUmakefile $(INSTALL_DIR)/src/Makefile.win
	if test -n "${MAN_FILES}" ; then cp -r $(MAN_FILES) $(INSTALL_DIR)/man ; fi
	cp -r $(R_SOURCE) $(INSTALL_DIR)/R
#	cp  install.R $(INSTALL_DIR)
	mkdir $(INSTALL_DIR)/inst
	mkdir $(INSTALL_DIR)/inst/Docs
	if test -n "$(DOCS)" ; then cp $(DOCS) $(INSTALL_DIR)/inst/Docs ; fi
	cp Install/registry.S $(INSTALL_DIR)/inst
	cp -r examples $(INSTALL_DIR)/inst
	cp -r tests $(INSTALL_DIR)/inst
	find $(INSTALL_DIR) -name '*~' -exec rm {} \;

PWD=$(shell pwd)

release: source binary

binary: 
	(cd $(RHOME)/src/library ; Rcmd build --binary $(PKG_NAME); mv $(ZIP_FILE) $(PWD))

zip:
	(cd $(RHOME)/library ; zip -r $(ZIP_FILE) $(PKG_NAME); mv $(ZIP_FILE) $(PWD))

source: package
#	(cd $(RHOME)/src/library ; zip -r $(ZIP_SRC_FILE) $(PKG_NAME); mv $(ZIP_SRC_FILE) $(PWD))
	(cd $(RHOME)/src/library ; tar zcf $(TAR_SRC_FILE) $(PKG_NAME); mv $(TAR_SRC_FILE) $(PWD))


install: package
	(cd $(RHOME)/src/gnuwin32 ; make pkg-$(PKG_NAME))

check: package
	(cd $(RHOME)/src/library ; Rcmd check $(PKG_NAME))

file:
	@echo "${PKG_FILES}"

#R/namedFunctions.S: Docs/UserGuide.xml
#	$(MAKE) -C Docs ../R/namedFunctions.S

Docs/%.html: Docs/%.xml
	$(MAKE) -C Docs $(@F)
