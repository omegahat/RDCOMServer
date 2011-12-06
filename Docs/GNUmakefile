all: UserGuide.html Paradigm.html

ifndef OMEGA_HOME
 OMEGA_HOME=../../..
 OMEGA_HOME=D:/duncan/Projects/org/omegahat
 WINDOWS=1
endif

include $(OMEGA_HOME)/Config/GNUmakefile.xml

ifndef WINDOWS
include $(OMEGA_HOME)/Config/GNUmakefile.config

include $(OMEGA_HOME)/Config/GNUmakefile.rules
else
PDFLATEX=c:/texmf/miktex/bin/pdflatex -include-directory="D:/duncan/Projects/org/omegahat/Docs"
%.pdf: %.tex
	$(PDFLATEX) $*
endif


ifndef XSLTPROC
 XSLTPROC=xsltproc
endif

CODE_XSL=$(OMEGA_HOME)/XML/Literate/code.xsl

../R/namedFunctions.S: UserGuide.xml $(CODE_XSL)
	if test -e "$@" ; then chmod +w $@ ; fi
	$(XSLTPROC) -o $@ -param group "'$(@F)'" $(CODE_XSL) UserGuide.xml
	chmod -w $@



