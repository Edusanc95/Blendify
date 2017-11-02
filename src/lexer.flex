
/* ---------- User code -----------------------*/
import java.util.*;

class Utility {

    private static final Hashtable<String, String> keyWords =
	new Hashtable<String, String>() {{
	    put("begin", "begin"); 
	    put("end", "end");
	    put("declaration", "declaration");
	    put("scene", "scene");
	    put("action", "action");
	    put("static", "type_figure");
	    put("dynamic", "type_figure");
	    put("position", "type_value");
	    put("scale", "type_value");
	    put("rotation", "type_value");
	    put("weight", "type_value");
	    put("speed", "type_value");
	    put("Cube", "form_figure");
	    put("Sphere" , "form_figure");
	    put("Cone" , "form_figure");
	    put("Cylinder" , "form_figure");
	    put("Force_field" , "form_figure");
	    put("Ramp" , "form_figure");
	    put("Plane" , "form_figure");
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
"begin"	{System.out.println(Utility.keyWord("begin"));}
"end"	{System.out.println(Utility.keyWord("end"));}
"declaration"	 {System.out.println(Utility.keyWord("declaration"));}
"scene"		 {System.out.println(Utility.keyWord("scene"));}
"action"	 {System.out.println(Utility.keyWord("action"));}
"static"	 {System.out.println(Utility.keyWord("static"));}
"dynamic"	 {System.out.println(Utility.keyWord("dynamic"));}
"{"		 {System.out.println("OB");}
"}"		 {System.out.println("CB");}
"="		 {System.out.println("EQ");}
[gplane|gspeed|gcollision]					{System.out.println(Utility.keyWord("type_goal"));}
[position|rotation|scale|weight|speed]	{System.out.println("value");}
[Cube|Sphere|Cone|Cylinder|Force_field|Ramp|Plane]	{System.out.println(Utility.keyWord("type_figure"));}
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
