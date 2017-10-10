*/ ---------- User code -----------------------*/
import java.io.*;

public void printDetected(String token) {
       System.out.println("Detected: " + token);
}

/* ---------- Rules and Actions ---------------*/
"begin"	{printDetected("begin");}
"end"	{printDetected("end");}
"declaration"	 {printDetected("declaration");}
"scene"		 {printDetected("scene");}
"action"	 {printDetected("action");}
"static"	 {printDetected("static");}
"dynamic"	 {printDetected("dynamic");}
"{"		 {printDetected("OB");}
"}"		 {printDetected("CB");}
["Cube"|"Sphere"|"Cone"|"Cylinder"|"Force_field"|"Ramp"|"Plane"]	{printDetected("type_figure");}
body_scene ::= ‘{‘ {(attribute_case ‘=’ goal)} ’}’
attribute_case := Case id_case
goal ::=  gplane | gspeed | gcollision | goal2
goal2 ::= ‘(‘ goal { condition goal } ‘)’
["position"|"rotation"|"scale"|"weight"|"speed"]	{printDetected("value");}
","	      {printDetected("Comma");}
(	      {printDetected("OP");}
)	      {printDetected("CP");}
["AND"|"OR"]  {printDetected("Conditional");}
[a-zA-Z]      {printDetected("Alphabetic");}
[0-9]+('.'[0-9])+ {printDetected("Real");}
/*[0-9]		   {printDetected("Digit");}*/

