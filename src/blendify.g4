// Define a grammar called blendify
grammar blendify;
program					: BEGIN id body_program END ;
body_declaration 		: '{' (STATIC attribute_declaration '=' value_static)
					  	  | (DYNAMIC attribute_declaration '=' value_dynamic) '}' ;
body_action         	: '{' START_SIMULATION '}' ;
body_program            : DECLARATION body_declaration SCENE body_scene ACTION body_action ;
body_scene          	: '{' (attribute_case '=' goal) '}' DYNAMIC ;
attribute_declaration   : type_figure id ;
type_figure             : CUBE | SPHERE | CONE | CYLINDER | FORCE_FIELD | RAMP | PLANE ;
attribute_case          : CASE id ;
goal                    : goal_n ;
goal_n                  : gplane goal_n | gspeed goal_n | gcollision goal_n | ;					// remove left recursion
goal2					: '(' goal condition_goal ')' ;
condition_goal          : condition goal condition_goal | ;
gplane                  : 'a' ;																	// example
gspeed                  : 'b' ; 																// example
gcollision              : 'c' ; 																// example
value_static            : position | rotation | scale ;
value_dynamic			: position | rotation | scale | weight | speed ;
id 						: alphabetic | alphanumeric ;
position 				: POSITION coordinates ;
rotation 				: ROTATION coordinates ;
scale 					: SCALE coordinates ;
weight 					: WEIGHT real ;
speed 					: SPEED coordinates ;
coordinates 			: '(' real ',' real ',' real ')' ;
condition				: AND | OR ;
alphabetic 				: LOWER_CASE | UPPER_CASE ;
alphanumeric 			: alphabetic | DIGIT ;
real 					: DIGIT | DIGIT '.' DIGIT ;

// Define Tokens
BEGIN 					: 'begin';
END						: 'end';
DECLARATION             : 'declaration';
SCENE                   : 'scene';
ACTION                  : 'action';
STATIC 					: 'static';
DYNAMIC 				: 'dynamic';
START_SIMULATION    	: 'start_simulation';
CUBE                    : 'Cube';
SPHERE                  : 'Sphere';
CONE                    : 'Cone';
CYLINDER                : 'Cylinder';
FORCE_FIELD             : 'Force_field';
RAMP                    : 'Ramp';
PLANE                   : 'Plane';
CASE                    : 'Case';
POSITION 				: 'position';
ROTATION 				: 'rotation';
SCALE 					: 'scale';
WEIGHT 					: 'weight';
SPEED 					: 'speed';
AND 					: 'AND';
OR						: 'OR';
LOWER_CASE              : [a-z]+;
UPPER_CASE              : [A-Z]+;
DIGIT					: [0-9]+;

WS       			    : [ \t\r\n]+ -> skip ; 		// skip spaces, tabs, newlines
