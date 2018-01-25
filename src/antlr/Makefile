all:
	java -jar /usr/local/lib/antlr-4.6-complete.jar blendify.g4
	javac *.java

test:
	java org.antlr.v4.gui.TestRig blendify program ejemplo.txt -gui

clean:
	rm *.class

