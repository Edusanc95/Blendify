# Tests
The present file intends to show multiple examples of how to use the tool that has been developed
to represent objects in Blender.

## Test 1
In this test, we are going to create a cube and a sphere. On the one hand, we will place a cube in a specific location
and change its size and rotation. On the other hand, we will only place a sphere in a specific location. If we
do not specify the size, rotation and location, among other values of an object, Blender will set all possible values as default.
This code represents the previous description:

```
begin grammar
        declaration {
                static Cube object1 {
                	location (-1, 1.2, 1) ;
                	rotation (2, 3, 4) ;
                	scale (1.0, 2, 4) ;
                }
                dynamic Sphere object2 {
                	location(1, 4, 5) ;
                }
        }
        action {
                start_simulation ;
        }
end
```
This code is at https://github.com/Edusanc95/Blendify/blob/master/src/tests/test1.txt.
In order to compile this file, we have to go to ``jflex_cup`` or ``antlr`` folder and run ``make all``. This command will generate
a python file like this:
```python
import bpy

origin_object1 = (-1.0, 1.2, 1.0)
bpy.ops.mesh.primitive_cube_add(location=origin_object1)
bpy.ops.transform.resize(value=(1.0, 2.0, 4.0))
bpy.ops.transform.rotate(axis=(2.0, 3.0, 4.0))
object1 = bpy.context.object
object1.name = 'cube'

origin_object2 = (1.0, 4.0, 5.0)
bpy.ops.mesh.primitive_uv_sphere_add(location=origin_object2)
object2 = bpy.context.object
object2.name = 'sphere'
```
Once we have the python file, we can copy it in Blender console to see create the objects. In the picture below we can 
see the result:
![Map](https://github.com/Edusanc95/Blendify/blob/master/images/test1.png)

## Test 2
In this test, we are going to create a sphere. The sphere will be placed in a specific location. As we have not defined
the size, rotation and location, among other values of an object, Blender will set all possible values as default.
This code represents the previous description:
```
begin grammar
/* ignore this comment */
        declaration {
                dynamic Sphere object2 {
                	location(1, 4, 5) ;
                }
        }
        action {
                start_simulation ;
        }
end
```
As we can see, the language admits comments which will be ignored. This code is at 
https://github.com/Edusanc95/Blendify/blob/master/src/tests/test2.txt. In order to compile this file, 
we have to go to ``jflex_cup`` or ``antlr`` folder and run ``make all``. This command will generate
a python file like this:
```python
import bpy

origin_object2 = (1.0, 4.0, 5.0)
bpy.ops.mesh.primitive_uv_sphere_add(location=origin_object2)
object2 = bpy.context.object
object2.name = 'sphere'
```
Once we have the python file, we can copy it in Blender console to see create the objects. In the picture below we can 
see the result:
![Map](https://github.com/Edusanc95/Blendify/blob/master/images/test2.png)

## Test 3
In this test, we are going to create a cube, a sphere and a cylinder. Firstly, we will modify the scale of a cube. As the 
location is not defined, it will be set as default (0, 0, 0). Secondly, we will only modify the location of a sphere. Finally,
a cylinder will be placed in a specific location and rotated towards the three axes.
This code represents the previous description:
```
begin grammar
        declaration {
                /*
                ignore
                this
                comment
                */
                static Cube object1 {
                        scale (3, 3, 3) ;
                }
                dynamic Sphere object2 {
                	location (1, 4, 5) ;
                }
                // ignore this comment
                static Cylinder object3 {
                        location (5, 5, 5) ;
                        rotation (1.3, 2.3, 5) ;
                }
        }
        action {
                start_simulation ;
        }
end
```
As we can see, the language also admits multiline comments which will be ignored. This code is at 
https://github.com/Edusanc95/Blendify/blob/master/src/tests/test3.txt. In order to compile this file, 
we have to go to ``jflex_cup`` or ``antlr`` folder and run ``make all``. This command will generate
a python file like this:
```python
import bpy

origin_object1 = (0, 0, 0)
bpy.ops.mesh.primitive_cube_add(location=origin_object1)
bpy.ops.transform.resize(value=(3.0, 3.0, 3.0))
object1 = bpy.context.object
object1.name = 'cube'

origin_object2 = (1.0, 4.0, 5.0)
bpy.ops.mesh.primitive_uv_sphere_add(location=origin_object2)
object2 = bpy.context.object
object2.name = 'sphere'

origin_object3 = (5.0, 5.0, 5.0)
bpy.ops.mesh.primitive_cylinder_add(location=origin_object3)
bpy.ops.transform.rotate(axis=(1.3, 2.3, 5.0))
object3 = bpy.context.object
object3.name = 'cylinder'
```
Once we have the python file, we can copy it in Blender console to see create the objects. In the picture below we can 
see the result:
![Map](https://github.com/Edusanc95/Blendify/blob/master/images/test3.png)
