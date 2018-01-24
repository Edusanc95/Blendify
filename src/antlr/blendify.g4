// Define a grammar called blendify
grammar blendify;
program					: BEGIN id body_program END ;
body_declaration 		: '{' static_dynamic '}' ;
static_declaration		: STATIC figure_declaration '{' attribute_declaration '}' ;
dynamic_declaration		: DYNAMIC figure_declaration '{' value '}' ;
static_dynamic			: static_declaration static_dynamic | dynamic_declaration static_dynamic | ;	
body_action         	: '{' START_SIMULATION ';' '}' ;
body_program            : DECLARATION body_declaration ACTION body_action ;
figure_declaration   	: type_figure id ;
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
coordinates 			: '(' real ',' real ',' real ')' ;
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