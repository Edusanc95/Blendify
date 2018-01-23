/* -------------------------- user section ------------------------*/
import java_cup.runtime.Symbol;

%%

/* ----------------- declaration and option section -----------------*/

%standalone
%class analex
%line
%column
%cup
%state COMMENT

%{

static utility utility = new utility();

private Symbol symbol(int type) {
   return new Symbol(type,yyline,yycolumn);
}

private Symbol symbol(int type,Object value){ 
	return new Symbol(type,yyline,yycolumn,value); 
} 


%}

%%

/* ---------- rules and actions ---------------*/
<YYINITIAL> {										/* begin YYINITIAL */
"/*"												{yybegin(COMMENT);}
"*/"												{ /*ERROR*/ }
"begin"												{return symbol(sym.BEGIN);}
"end"												{return symbol(sym.END);}
"declaration"										{return symbol(sym.DECLARATION);}
"action"											{return symbol(sym.ACTION);}
"static"											{return symbol(sym.STATIC_OBJECT);}
"dynamic"											{return symbol(sym.DYNAMIC_OBJECT);}
"{"													{return symbol(sym.LEFTBRACKET);}
"}"													{return symbol(sym.RIGHTBRACKET);}
"="													{return symbol(sym.EQUAL);}
";"													{return symbol(sym.SEMICOLON);}
"start_simulation"									{return symbol(sym.START_SIMULATION);}
"position" 											{return symbol(sym.VALUE_STATIC);}
"rotation" 											{return symbol(sym.VALUE_STATIC);}
"scale"												{return symbol(sym.VALUE_STATIC);}
"weight" 											{return symbol(sym.VALUE_DYNAMIC);}
"speed"												{return symbol(sym.VALUE_DYNAMIC);}
"Cube" 												{return symbol(sym.TYPE_FIGURE);}
"Sphere" 											{return symbol(sym.TYPE_FIGURE);}
"Cone" 												{return symbol(sym.TYPE_FIGURE);}
"Cylinder"											{return symbol(sym.TYPE_FIGURE);}
"Force_field"										{return symbol(sym.TYPE_FIGURE);}
"Ramp"												{return symbol(sym.TYPE_FIGURE);}
"Plane"												{return symbol(sym.TYPE_FIGURE);}
","													{return symbol(sym.COMMA);}
")"													{return symbol(sym.RIGHTPARENT);}
"("													{return symbol(sym.LEFTPARENT);}
-?(([0-9]+)|([0-9]*\.[0-9]+))						{return symbol(sym.REAL, new Float(yytext()));}
[a-z]+[a-zA-Z0-9_]* 								{String token = yytext();
													if(utility.keyWord.containsKey(token))
														return symbol(utility.keyWord.get(token), new String(yytext()));
													else
														return symbol(sym.ID, new String(yytext()));}
[ \t\n\r\f]	  										{ /* ignore spaces */ }
.													{System.err.println("Ilegal character: " + "\'" + yytext() + "\' "
													 + " line: " + (yyline + 1) + " and column: " + (yycolumn + 1));}
}													/* end YYINITIAL */

<COMMENT> 											{
"*/"	  											{yybegin(YYINITIAL);}
<<EOF>>   											{/*ERROR*/}
}
