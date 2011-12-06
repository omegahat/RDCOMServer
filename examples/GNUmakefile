Sengine.html:

include $(OMEGA_HOME)/Config/GNUmakefile.xml

ifdef ADMIN
# For populating the web site.

HTML_STYLESHEET=S.css

OMEGA_CSS_DIR=$(OMEGA_HOME)/Docs/CSS

include ../VersionInfo
S_FILES=OutOfProcess.S random.S Sdispatch.S extendedEngine.S
XML_FILES=$(wildcard *.xml)
WEB_FILES=$(S_FILES) \
          ttest.html ttest.pl ttest.py ttest.S \
          Sengine.html Sengine.py Sengine.pl Sengine.py extendedEngine.S \
	  Sobject.html Sobject.S Sobject.vb  \
	  random.S random.pl random.html \
	  container.html container.S \
	  event.html event.S \
	  testRDAProfile.html testRDAProfile.S testRDAProfile.py dataFrame.S dataFrame.pl \
	  addin.S addin.html \
          $(OMEGA_CSS_DIR)/S.css index.html $(XML_FILES)


webInstall: $(WEB_FILES)
	scp $(WEB_FILES) franz.stat.wisc.edu:/home/ftp/pub/Omega/$(PKG_NAME)/examples

html: $(XML_FILES:%.xml=%.html)
all: $(WEB_FILES)
endif

#XSL_DIR=/cygdrive/d/duncan/Projects/org/omegahat/XML/Literate
XSL_DIR=/home/Statistics/Projects/org/omegahat/XML/Literate
CROUTINE_XSL=$(shell cygpath -w $(XSL_DIR)/croutine.xsl)

ifdef WINDOWS
# CXSL:=$(shell cygpath -w $(CXSL) | sed -e 's/\\/\\\\/g')
 CXSL:=$(shell cygpath -m $(CXSL))
endif

ttt:
	echo "$(CXSL)"


%.S: %.xml
	xsltproc -o $@ -param language "'S'" -param group "'$(@F)'" $(CXSL) $<

extendedEngine.S: Sengine.xml
	xsltproc -o $@ -param language "'S'" -param group "'$(@F)'" $(XSL_DIR)/croutine.xsl $<

event.S: event.xml
	xsltproc -o $@ -param language "'S'" -param group "'$(@F)'" $(XSL_DIR)/croutine.xsl $<


dataFrame.S: testRDAProfile.xml
	xsltproc -o $@ -param language "'S'" -param group "'$(@F)'" $(XSL_DIR)/croutine.xsl $<

dataFrame.pl: testRDAProfile.xml
	xsltproc -o $@ -param language "'perl'" -param group "'$(@F)'" $(XSL_DIR)/croutine.xsl $<

XSL_DIR=/cygdrive/d/duncan/Projects/org/omegahat/XML/Literate
%.html: %.xml
	xsltproc -o $@ $(OMEGA_HOME)Docs/XSL/Rstyle.xsl $<
