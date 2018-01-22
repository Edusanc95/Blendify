JFLEX 	= jflex
CUP 	= cup
JC 		= javac
JAVA 	= java

all: jflex cup java
	$(JAVA) parser

java:
	$(JC) *.java

jflex:
	$(JFLEX) *.lex

cup:
	$(CUP) *.cup
	
clean:
	$(RM) *~
	$(RM) *.class
	$(RM) *.java