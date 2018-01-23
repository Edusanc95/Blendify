// Define a grammar called blendify
grammar blendify;
program					: BEGIN id body_program END ;
body_declaration 		: '{' static_declaration '}' static_dynamic | 
							'{' dynamic_declaration static_dynamic '}' ;
static_declaration		: STATIC attribute_declaration '=' value_static ';' ;
dynamic_declaration		: DYNAMIC attribute_declaration '=' value_dynamic ';' ;
static_dynamic			: static_declaration static_dynamic | dynamic_declaration
							static_dynamic | ;	
body_action         	: '{' START_SIMULATION ';' '}' ;
body_program            : DECLARATION body_declaration ACTION body_action ;
attribute_declaration   : type_figure id ;
type_figure             : CUBE | SPHERE | CONE | CYLINDER | FORCE_FIELD | RAMP | PLANE ;											// example
value_static            : position | rotation | scale ;
value_dynamic			: position | rotation | scale | weight | speed ;
id 						: ID ;
position 				: POSITION coordinates ;
rotation 				: ROTATION coordinates ;
scale 					: SCALE coordinates ;
weight 					: WEIGHT real ;
speed 					: SPEED coordinates ;
coordinates 			: '(' real ',' real ',' real ')' ;
condition				: AND | OR ;
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
POSITION 				: 'position' ;
ROTATION 				: 'rotation' ;
SCALE 					: 'scale' ;
WEIGHT 					: 'weight' ;
SPEED 					: 'speed' ;
AND 					: 'AND' ;
OR						: 'OR';
DIGIT					: '-'?[0-9]+ ;
ID 						: [a-z]+[a-zA-Z0-9_]* ;
WS       			    : [ \t\r\n]+ -> skip ; 		// skip spaces, tabs, newlines