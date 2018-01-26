JFLEX 	= jflex
CUP 	= cup
JC 		= javac
JAVA 	= java

all: jflex cup java
	$(JAVA) Main ../ejemplo.txt

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