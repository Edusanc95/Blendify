#!/usr/bin/make -f
# -*- mode:makefile -*-

JFLEX 	= jflex
CUP 	= cup
JC 		= javac
JAVA 	= java

TEST 	= ../tests

all: jflex cup java
	$(JAVA) Main $(TEST)/*.txt

java:
	$(JC) *.java

jflex:
	$(JFLEX) *.lex

cup:
	$(CUP) *.cup
	
clean:
	$(RM) *~
	$(RM) *.class
	$(RM) *.py
	$(RM) sym.java
	$(RM) analex.java
	$(RM) parser.java