JAVAC=c:/j2sdk1.4.1_01/bin/javac.exe
JAVA=c:/j2sdk1.4.1_01/bin/java.exe
JACOB_JAR=c:/tmp/JACOB/jacob.jar
PWD=d:/duncan/Projects/org/omegahat/R/RDCOMServer/tests 
#$(shell pwd -P)
NormalTest.class: NormalTest.java
	$(JAVAC) -classpath $(JACOB_JAR) $<

run: NormalTest.class
	$(JAVA) -classpath '$(PWD);$(JACOB_JAR)' NormalTest

