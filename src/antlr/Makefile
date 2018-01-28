#!/usr/bin/make -f
# -*- mode:makefile -*-

JC 		= javac
JAVA 	= java

GRAMMAR = blendify
ST_PROD = program

TEST 	= ../tests

all: antlr java
	$(JAVA) org.antlr.v4.gui.TestRig $(GRAMMAR) $(ST_PROD) $(TEST)/*.txt

java:
	$(JC) *.java

antlr:
	java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool *.g4
	
clean:
	$(RM) *~
	$(RM) *.class
	$(RM) *.tokens
	$(RM) *.interp
	$(RM) *.py
	$(RM) blendify*.java