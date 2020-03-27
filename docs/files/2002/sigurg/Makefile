JAVAC = /usr/bin/javac
JAVADOC = /usr/bin/javadoc

JAVAC_OPTS =
JAVADOC_OPTS = -d docs

.PHONY: all docs clean

%.class : %.java
	$(JAVAC) $(JAVAC_OPTS) $<

all: Client.class Server.class

docs:
	$(JAVADOC) $(JAVADOC_OPTS) *.java

clean:
	rm -f *.class
	rm -rf docs

