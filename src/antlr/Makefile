#!/usr/bin/make -f
# -*- mode:makefile -*-

ANTLR 	= antlr4
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
	$(ANTLR) *.g4
	
clean:
	$(RM) *~
	$(RM) *.class
	$(RM) *.tokens
	$(RM) *.interp
	$(RM) *.py
	$(RM) blendify*.java