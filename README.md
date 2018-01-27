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
```
$ sudo apt-get install jflex cup
$ export CLASSPATH="$CLASSPATH:/usr/share/java/cup.jar:/usr/share/java/JFlex.jar"
```

## Installation of Antlr and StringTemplate in Linux
```
$ cd /usr/local/lib
$ sudo wget http://stringtemplate.org/download/ST-4.0.8.jar
$ sudo wget http://www.antlr.org/download/antlr-4.7.1-complete.jar
$ export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
$ export CLASSPATH=".:/usr/local/lib/ST-4.0.8.jar:$CLASSPATH"
$ alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
$ alias grun='java org.antlr.v4.gui.TestRig'
```

## Run
In order to run this system, it is necessary to create a txt file using the language that has been proposed. The next code shows an example:
```
begin program
  declaration {
    static Cube object1 {
      location (-4.0, 2, 3);
      rotation (1, 2, 5);
    }
    dynamic Sphere object2 {
      location (1, 3.3, 6);
    }
  }
  action {
    start_simulation;
  }
end
```
Then, we must type the path of the txt file in the ``Makefile`` that is in the ``jflex_cup`` or ``antlr`` folder. We go to one
of these folders and type the following command: ``make all``. If the txt file is written correctly, a python file will be
generated. This is the python code that has been created.
```python
import bpy

origin_object2 = (1.0, 3.3, 6.0)
bpy.ops.mesh.primitive_uv_sphere_add(location=origin_object2)
object2 = bpy.context.object
object2.name = 'sphere'

origin_object1 = (-4.0, 2.0, 3.0)
bpy.ops.mesh.primitive_cube_add(location=origin_object1)
bpy.ops.transform.rotate(axis=(1.0, 2.0, 5.0))
object1 = bpy.context.object
object1.name = 'cube'
```
Finally, we can get this code and copy it in the Blender console to create the objects that we have specified in our txt file.
