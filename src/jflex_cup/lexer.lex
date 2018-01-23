import java_cup.runtime.Symbol;
import java.util.*;

class Utility {

    public static final Hashtable<String, Integer> keyWords =
	new Hashtable<String, Integer>() {{
	    put("begin", sym.BEGIN); 
	    put("end", sym.END);
	    put("declaration", sym.DECLARATION);
	    put("action", sym.ACTION);
	    put("static", sym.STATIC_OBJECT);
	    put("dynamic", sym.DYNAMIC_OBJECT);
	    put("position", sym.VALUE_STATIC);
	    put("scale", sym.VALUE_STATIC);
	    put("rotation", sym.VALUE_STATIC);
	    put("weight", sym.VALUE_DYNAMIC);
	    put("speed", sym.VALUE_DYNAMIC);
	    put("Cube", sym.TYPE_FIGURE);
	    put("Sphere" , sym.TYPE_FIGURE);
	    put("Cone" , sym.TYPE_FIGURE);
	    put("Cylinder" , sym.TYPE_FIGURE);
	    put("Force_field" , sym.TYPE_FIGURE);
	    put("Ramp" , sym.TYPE_FIGURE);
	    put("Plane" , sym.TYPE_FIGURE);
	}};
}

%%
%standalone
%cup
%class analex
%state COMMENT
%%

/* ---------- Rules and Actions ---------------*/
<YYINITIAL> {
"/*"												{yybegin(COMMENT);}
"*/"												{ /*ERROR*/ }
"begin"												{return new Symbol(sym.BEGIN);}
"end"												{return new Symbol(sym.END);}
"declaration"										{return new Symbol(sym.DECLARATION);}
"action"											{return new Symbol(sym.ACTION);}
"static"											{return new Symbol(sym.STATIC_OBJECT);}
"dynamic"											{return new Symbol(sym.DYNAMIC_OBJECT);}
"{"													{return new Symbol(sym.LEFTBRACKET);}
"}"													{return new Symbol(sym.RIGHTBRACKET);}
"="													{return new Symbol(sym.EQUAL);}
";"													{return new Symbol(sym.SEMICOLON);}
"start_simulation"									{return new Symbol(sym.START_SIMULATION);}
"position" 											{return new Symbol(sym.VALUE_STATIC);}
"rotation" 											{return new Symbol(sym.VALUE_STATIC);}
"scale"												{return new Symbol(sym.VALUE_STATIC);}
"weight" 											{return new Symbol(sym.VALUE_DYNAMIC);}
"speed"												{return new Symbol(sym.VALUE_DYNAMIC);}
"Cube" 												{return new Symbol(sym.TYPE_FIGURE);}
"Sphere" 											{return new Symbol(sym.TYPE_FIGURE);}
"Cone" 												{return new Symbol(sym.TYPE_FIGURE);}
"Cylinder"											{return new Symbol(sym.TYPE_FIGURE);}
"Force_field"										{return new Symbol(sym.TYPE_FIGURE);}
"Ramp"												{return new Symbol(sym.TYPE_FIGURE);}
"Plane"												{return new Symbol(sym.TYPE_FIGURE);}
","													{return new Symbol(sym.COMMA);}
")"													{return new Symbol(sym.RIGHTPARENT);}
"("													{return new Symbol(sym.LEFTPARENT);}
-?(([0-9]+)|([0-9]*\.[0-9]+))						{return new Symbol(sym.REAL);}
[a-z]+[a-zA-Z0-9_]* 								{String token = yytext();
													if(Utility.keyWords.containsKey(token))
														return new Symbol(Utility.keyWords.get(token));
													else
														return new Symbol(sym.ID);}
[ \t\n\r\f]	  										{ /* ignora delimitadores */ }
}													/* end YYINITIAL */

<COMMENT> 											{
"*/"	  											{yybegin(YYINITIAL);}
<<EOF>>   											{/*ERROR*/}
}
