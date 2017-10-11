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
["gplane"|"gspeed"|"gcollision"]					{printDetected("type_goal");}
["position"|"rotation"|"scale"|"weight"|"speed"]	{printDetected("value");}
","	      {printDetected("Comma");}
(	      {printDetected("OP");}
)	      {printDetected("CP");}
["AND"|"OR"]  {printDetected("Conditional");}
[a-zA-Z]      {printDetected("Alphabetic");}
[0-9]+('.'[0-9])+ {printDetected("Real");}
/*[0-9]		   {printDetected("Digit");}*/

