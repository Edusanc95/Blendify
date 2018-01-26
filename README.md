# Blendify
This system is a language processor that intends to create a python file from an input to represent scenarios in blender to 
teach Physic.

## Prerequisites
In order to use this system it is necessary to install some tools:
* Jflex
* Cup
* Antlr
* StringTemplate

## Installation of Jflex and Cup in Linux
``$ sudo apt-get install jflex cup``

``$ export CLASSPATH="$CLASSPATH:/usr/share/java/cup.jar:/usr/share/java/JFlex.jar"``

## Installation of Antlr and StringTemplate in Linux
``$ cd /usr/local/lib``

``$ sudo wget http://stringtemplate.org/download/ST-4.0.8.jar``

``$ sudo wget http://www.antlr.org/download/antlr-4.7.1-complete.jar``

``$ export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"``

``$ export CLASSPATH=".:/usr/local/lib/ST-4.0.8.jar:$CLASSPATH"``

``$ alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'``

``$ alias grun='java org.antlr.v4.gui.TestRig'``
