
/* ---------- User code -----------------------*/
import java.util.*;

class Utility {

    private static final Hashtable<String, String> keyWords =
	new Hashtable<String, String>() {{
	    put("begin", "begin"); 
	    put("end", "end");
	    put("declaration", "declaration");
	    put("scene", "scene");
	    put("action", "type_figure");
	    put("static", "type_figure");
	    put("dynamic", "type_figure");
	    put("position", "type_value");
	    put("scale", "type_value");
	    put("rotation", "type_value");
	    put("weight", "type_value");
	    put("speed", "type_value");
	    put("Cube", "type_figure");
	    put("Sphere" , "type_figure");
	    put("Cone" , "type_figure");
	    put("Cylinder" , "type_figure");
	    put("Force_field" , "type_figure");
	    put("Ramp" , "type_figure");
	    put("Plane" , "type_figure");
	}};
	
    public static String keyWord ( String cadena ) {
	for(String key_keyword : keyWords.keySet()) {
	    if(key_keyword.equals(cadena)) {
		return keyWords.get(key_keyword);
	    }
	}
	return "";
    }
}

%%
%standalone
%class analex
%state COMMENT
%%
/* ---------- Rules and Actions ---------------*/

<YYINITIAL> {
"/*"		  {yybegin(COMMENT); System.out.println("BEGIN COMMENT");}
"*/"              {/*ERROR*/}
"begin"	{System.out.println("begin");}
"end"	{System.out.println("end");}
"declaration"	 {System.out.println("declaration");}
"scene"		 {System.out.println("scene");}
"action"	 {System.out.println("action");}
"static"	 {System.out.println("static");}
"dynamic"	 {System.out.println("dynamic");}
"{"		 {System.out.println("OB");}
"}"		 {System.out.println("CB");}
"="		 {System.out.println("EQ");}
[gplane|gspeed|gcollision]					{System.out.println("type_goal");}
[position|rotation|scale|weight|speed]	{System.out.println("value");}
[Cube|Sphere|Cone|Cylinder|Force_field|Ramp|Plane]	{System.out.println("type_figure");}
","	      {System.out.println("Comma");}
"("	      {System.out.println("OP");}
")"	      {System.out.println("CP");}
["AND"|"OR"]  {System.out.println("Conditional");}
[a-zA-Z]      {System.out.println("Alphabetic");}
[0-9]+('.'[0-9])+ {System.out.println("Real");}
[ \t\n\r\f]	  {}
.		  {System.out.println("Not valid: " + yytext());}
} /* end YYINITIAL */

<COMMENT> {
"*/"	  {yybegin(YYINITIAL); System.out.println("END COMMENT");}
<<EOF>>   {/*ERROR*/}
"."	  {}
}
