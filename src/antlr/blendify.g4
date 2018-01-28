// Define a grammar called blendify
grammar blendify;

@header {
	import org.stringtemplate.v4.*;
	import java.io.PrintWriter;
}// end header

@members {
	/* Variable to modify the file name */
	static int count = 1;

	/* Stores the attibutes of an object */
	public Container generateContainer(Container recent, Container old){
		Container c = null;
		if(old == null){
			c = new Container();
			if(recent.getLocation() != null)
				c.setLocation(recent.getLocation());
			else if(recent.getRotation() != null)
				c.setRotation(recent.getRotation());
			else if(recent.getScale() != null)
				c.setScale(recent.getScale());
			else if(recent.getSpeed() != null)
				c.setSpeed(recent.getSpeed());
			else if(recent.getWeight() != null)
				c.setWeight(recent.getWeight());
		}
		else{
			if(recent.getLocation() != null)
				old.setLocation(recent.getLocation());
			else if(recent.getRotation() != null)
				old.setRotation(recent.getRotation());
			else if(recent.getScale() != null)
				old.setScale(recent.getScale());
			else if(recent.getSpeed() != null)
				old.setSpeed(recent.getSpeed());
			else if(recent.getWeight() != null)
				old.setWeight(recent.getWeight());
			c = old;
		}
		return c;
	}

	/* Creates a template for each object */
	public ST generateST(Type_figure type, Container container){
		STGroup stGroup = new STGroupFile("../template/primitive_shape.stg");
		ST template = stGroup.getInstanceOf("primitive_shape");
		template.add("figure", type.getFigure());
		template.add("name", type.getId());

		if(container.getLocation() != null){
			template.add("origin_x", container.getLocation().getX());
			template.add("origin_y", container.getLocation().getY());
			template.add("origin_z", container.getLocation().getZ());
		}
		if(container.getRotation() != null){
			template.add("rotation_x", container.getRotation().getX());
			template.add("rotation_y", container.getRotation().getY());
			template.add("rotation_z", container.getRotation().getZ());
		}if(container.getScale() != null){
			template.add("scale_x", container.getScale().getX());
			template.add("scale_y", container.getScale().getY());
			template.add("scale_z", container.getScale().getZ());
		}
		return template;
	}

	/* Generates the python file according to the code of template */
	public void generate_python_file(ContainerST containerST){
		String file = "blendify_output" + (count++) + ".py";
		try {
			PrintWriter out = new PrintWriter(file);
			while(!containerST.isEmpty()){
				out.println(containerST.poll().render());
			}
			out.close();
		} catch (Exception e) {
			System.out.println("Exception!!! " + e.getStackTrace());
		}
		System.out.println("\n" + file + " generated");
	}
}// end members

program					
	: BEGIN ID body_program END 
	{
		generate_python_file($body_program.containerST);
	} ;

body_program returns
	[
		ContainerST containerST
	]
	: DECLARATION body_declaration ACTION body_action
	{
		STGroup stGroup = new STGroupFile("../template/import.stg");
		ST template = stGroup.getInstanceOf("import_sentence");
		template.add("name", "bpy");
		$body_declaration.containerST.add(template);
		$containerST = $body_declaration.containerST;
	} ;

body_declaration returns
	[
		ContainerST containerST
	]
	: LEFTBRACKET static_declaration static_dynamic RIGHTBRACKET 
	{
		ContainerST c = null;
		if($static_dynamic.containerST == null)
			c = new ContainerST();
		else
			c = $static_dynamic.containerST;
		c.add($static_declaration.template);
		$containerST = c;
	}
	| LEFTBRACKET dynamic_declaration static_dynamic RIGHTBRACKET
	{
		ContainerST c = null;
		if($static_dynamic.containerST == null)
			c = new ContainerST();
		else
			c = $static_dynamic.containerST;
		c.add($dynamic_declaration.template);
		$containerST = c;
	} ;

body_action
	: LEFTBRACKET START_SIMULATION SEMICOLON RIGHTBRACKET ;

static_declaration returns
	[
		ST template
	]
	: STATIC figure_declaration LEFTBRACKET attribute_declaration RIGHTBRACKET 
	{
		ST aux = generateST($figure_declaration.type, $attribute_declaration.container);
		$template = aux;
	} ;

static_dynamic returns
	[
		ContainerST containerST
	]
	: static_declaration static_dynamic
	{
		ContainerST c = null;
		if($static_dynamic.containerST == null){
			c = new ContainerST();
			c.add($static_declaration.template);
		}else{
			c = $static_dynamic.containerST;
			c.add($static_declaration.template);
		}
		$containerST = c;
	}
	| dynamic_declaration static_dynamic
	{
		ContainerST c = null;
		if($static_dynamic.containerST == null){
			c = new ContainerST();
			c.add($dynamic_declaration.template);
		}else{
			c = $static_dynamic.containerST;
			c.add($dynamic_declaration.template);
		}
		$containerST = c;
	}
	|
	{
		$containerST = null;
	} ;

dynamic_declaration returns
	[
		ST template
	]	
	: DYNAMIC figure_declaration LEFTBRACKET value_object RIGHTBRACKET 
	{
		ST aux = generateST($figure_declaration.type, $value_object.container);
		$template = aux;
	} ;

figure_declaration returns
	[
		Type_figure type
	]
	: type_figure id 
	{
		String tp_lowerCase = $type_figure.text.toLowerCase();
		Type_figure aux = null;
		if(!$type_figure.text.equals("Sphere"))
			aux = new Type_figure(tp_lowerCase, $id.text);
		else
			aux = new Type_figure($id.text);
		$type = aux;
	} ;

attribute_declaration returns
	[
		Container container
	]
	: value_static attribute_declaration
	{
		Container c = generateContainer($value_static.container, $attribute_declaration.container);
		$container = c;
	}
	|
	{
		$container = null;
	} ;

type_figure             
	: CUBE
	| SPHERE
	| CONE
	| CYLINDER
	| PLANE
	;

value_object returns
	[
		Container container
	]
	: value_dynamic value_object
	{
		Container c = generateContainer($value_dynamic.container, $value_object.container);
		$container = c;
	}
	| value_static value_object
	{
		Container c = generateContainer($value_static.container, $value_object.container);
		$container = c;
	}
	| 
	{
		$container = null;
	} ;


value_static returns
	[
		Container container
	]
	: location
	{
		Container c = new Container($location.object_location);
		$container = c;
	}
	| rotation
	{
		Container c = new Container($rotation.object_rotation);
		$container = c;
	}
	| scale
	{
		Container c = new Container($scale.object_scale);
		$container = c;
	} ;

value_dynamic returns
	[
		Container container
	]
	: weight
	{
		Container c = new Container($weight.object_weight);
		$container = c;
	}
	| speed
	{
		Container c = new Container($speed.object_speed);
		$container = c;
	} ;

id
	: ID ;

location returns
	[
		Location object_location
	]
	: LOCATION coordinates SEMICOLON
	{
		$object_location = new Location($coordinates.object_coordinates.getX(), 
								$coordinates.object_coordinates.getY(),
								$coordinates.object_coordinates.getZ());
	} ;

rotation returns
	[
		Rotation object_rotation
	]
	: ROTATION coordinates SEMICOLON
	{
		$object_rotation = new Rotation($coordinates.object_coordinates.getX(), 
								$coordinates.object_coordinates.getY(),
								$coordinates.object_coordinates.getZ());
	} ;

scale returns
	[
		Scale object_scale
	]
	: SCALE coordinates SEMICOLON
	{
		$object_scale = new Scale($coordinates.object_coordinates.getX(), 
							$coordinates.object_coordinates.getY(),
							$coordinates.object_coordinates.getZ());
	} ;

weight returns
	[
		Weight object_weight
	]
	: WEIGHT real SEMICOLON
	{
		$object_weight = new Weight($real.text);
	} ;

speed returns
	[
		Speed object_speed
	]
	: SPEED coordinates SEMICOLON
	{
		$object_speed = new Speed($coordinates.object_coordinates.getX(), 
							$coordinates.object_coordinates.getY(),
							$coordinates.object_coordinates.getZ());
	} ;

coordinates returns
	[
		Coordinates object_coordinates
	]
	: LEFTPARENT r1=real COMMA r2=real COMMA r3=real RIGHTPARENT
	{
		$object_coordinates = new Coordinates($r1.text, $r2.text, $r3.text);
	};

real
	: DIGIT | DIGIT '.' DIGIT ;

// Define Tokens
BEGIN 					: 'begin' ;
END						: 'end' ;
DECLARATION             : 'declaration' ;
ACTION                  : 'action' ;
STATIC 					: 'static' ;
DYNAMIC 				: 'dynamic' ;
START_SIMULATION    	: 'start_simulation' ;
CUBE                    : 'Cube' ;
SPHERE                  : 'Sphere' ;
CONE                    : 'Cone' ;
CYLINDER                : 'Cylinder' ;
PLANE                   : 'Plane' ;
LOCATION 				: 'location' ;
ROTATION 				: 'rotation' ;
SCALE 					: 'scale' ;
WEIGHT 					: 'weight' ;
SPEED 					: 'speed' ;
LEFTPARENT 				: '(' ;
RIGHTPARENT 			: ')' ;
LEFTBRACKET 			: '{' ;
RIGHTBRACKET 			: '}' ;
SEMICOLON 				: ';' ;
COMMA 					: ',' ;
DIGIT					: '-'?[0-9]+ ;
ID 						: [a-z]+[a-zA-Z0-9_]* ;
WS       			    : [ \t\r\n]+ -> skip ; 		// skip spaces, tabs, newlines
COMMENT 				: '/*' .*? '*/' -> skip ; 	// skip comments
LINE_COMMENT			: '//' ~[\r\n]* -> skip ; 	// skip line comment
