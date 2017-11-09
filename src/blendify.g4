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
BEGIN 					: ( 'b' )( 'e' )( 'g' )( 'i' )( 'n' );
END						: ( 'e' )( 'n' )( 'd' );
DECLARATION             : ( 'd' )( 'e' )( 'c' )( 'l' )( 'a' )( 'r' )( 'a' )( 't' )( 'i' )( 'o' )( 'n' );
SCENE                   : ( 's' )( 'c' )( 'e' )( 'n' )( 'e' );
ACTION                  : ( 'a' )( 'c' )( 't' )( 'i' )( 'o' )( 'n' );
STATIC 					: ( 's' )( 't' )( 'a' )( 't' )( 'i' )( 'c' );
DYNAMIC 				: ( 'd' )( 'y' )( 'n' )( 'a' )( 'm' )( 'i' )( 'c' );
START_SIMULATION    	: ( 's' )( 't' )( 'a' )( 'r' )( 't' )( '_' )( 's' )( 'i' )( 'm' )( 'u' )( 'l' )( 'a' )( 't' )( 'i' )( 'o' )( 'n' );
CUBE                    : ( 'C' )( 'u' )( 'b' )( 'e' );
SPHERE                  : ( 'S' )( 'p' )( 'h' )( 'e' )( 'r' )( 'e' );
CONE                    : ( 'C' )( 'o' )( 'n' )( 'e' );
CYLINDER                : ( 'C' )( 'y' )( 'l' )( 'i' )( 'n' )( 'd' )( 'e' )( 'r' );
FORCE_FIELD             : ( 'F' )( 'o' )( 'r' )( 'c' )( 'e' )( '_' )( 'f' )( 'i' )( 'e' )( 'l' )( 'd' );
RAMP                    : ( 'R' )( 'a' )( 'm' )( 'p' );
PLANE                   : ( 'P' )( 'l' )( 'a' )( 'n' )( 'e' );
CASE                    : ( 'C' )( 'a' )( 's' )( 'e' );
POSITION 				: ( 'p' )( 'o' )( 's' )( 'i' )( 't' )( 'i' )( 'o' )( 'n' );
ROTATION 				: ( 'r' )( 'o' )( 't' )( 'a' )( 't' )( 'i' )( 'o' )( 'n' );
SCALE 					: ( 's' )( 'c' )( 'a' )( 'l' )( 'e' );
WEIGHT 					: ( 'w' )( 'e' )( 'i' )( 'g' )( 'h' )( 't' );
SPEED 					: ( 's' )( 'p' )( 'e' )( 'e' )( 'd' );
AND 					: ( 'A' )( 'N' )( 'D' );
OR						: ( 'O' )( 'R' );
LOWER_CASE              : [a-z]+;
UPPER_CASE              : [A-Z]+;
DIGIT					: [0-9]+;

WS       			    : [ \t\r\n]+ -> skip ; 		// skip spaces, tabs, newlines
