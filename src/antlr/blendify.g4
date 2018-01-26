// Define a grammar called blendify
grammar blendify;
@header {
    import org.stringtemplate.v4.*;
    import java.io.PrintWriter;
    import java.io.File;
}
program	locals [ST template = (new STGroupFile("../template/blendify.stg")).getInstanceOf("figure");]
	: BEGIN id body_program END {
	    try {
		PrintWriter out = new PrintWriter("blendify_output.py");
	    
		out.println($template.render());
		out.close();
	    } catch (Exception e) {
		System.out.println("Exception!!! " +
				   e.getStackTrace());
	    }};


body_declaration 		: '{' static_dynamic '}' ;
static_declaration		: STATIC figure_declaration '{' attribute_declaration '}' ;
dynamic_declaration		: DYNAMIC figure_declaration '{' value '}' ;
static_dynamic			: static_declaration static_dynamic | dynamic_declaration static_dynamic | ;	
body_action         	: '{' START_SIMULATION ';' '}' ;
body_program            : DECLARATION body_declaration ACTION body_action ;
figure_declaration   	: type_figure id {$program::template.add("name", $id.text);};
attribute_declaration   : value_static attribute_declaration | ;
type_figure             : CUBE | SPHERE | CONE | CYLINDER | FORCE_FIELD | RAMP | PLANE ;
value_static            : location | rotation | scale ;
value_dynamic			: weight | speed ;
value 					: value_dynamic value| value_static  value | ;
id 						: ID ;
location 				: LOCATION coordinates ';' ;
rotation 				: ROTATION coordinates ';' ;
scale 					: SCALE coordinates ';' ;
weight 					: WEIGHT real ';' ;
speed 					: SPEED coordinates ';' ;
coordinates 			: '(' r1=real ',' r2=real ',' r3=real ')' {
				  $program::template.add("origin_x", $r1.text);
				  $program::template.add("origin_y", $r2.text);
				  $program::template.add("origin_z", $r3.text);
				   };
real 					: DIGIT | DIGIT '.' DIGIT ;

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
FORCE_FIELD             : 'Force_field' ;
RAMP                    : 'Ramp' ;
PLANE                   : 'Plane' ;
CASE                    : 'Case' ;
LOCATION 				: 'location' ;
ROTATION 				: 'rotation' ;
SCALE 					: 'scale' ;
WEIGHT 					: 'weight' ;
SPEED 					: 'speed' ;
DIGIT					: '-'?[0-9]+ ;
ID 						: [a-z]+[a-zA-Z0-9_]* ;
WS       			    : [ \t\r\n]+ -> skip ; 		// skip spaces, tabs, newlines
