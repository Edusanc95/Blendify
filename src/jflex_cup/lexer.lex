/* -------------------------- user section ------------------------*/
import java_cup.runtime.Symbol;

%%

/* ----------------- declaration and option section -----------------*/
%class analex
%switch
%line
%column
%cup
%standalone
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
"//".*                                    			{ /* DO NOTHING */ }
"*/"												{System.err.println("Beginning of comment incorrect: " + 
													"\'" + yytext() + "\' " + " line: " + (yyline + 1) + 
													" and column: " + (yycolumn + 1));}
"end"												{return symbol(sym.END);}
"declaration"										{return symbol(sym.DECLARATION);}
"action"											{return symbol(sym.ACTION);}
"static"											{return symbol(sym.STATIC_OBJECT);}
"dynamic"											{return symbol(sym.DYNAMIC_OBJECT);}
"{"													{return symbol(sym.LEFTBRACKET);}
"}"													{return symbol(sym.RIGHTBRACKET);}
";"													{return symbol(sym.SEMICOLON);}
"start_simulation"									{return symbol(sym.START_SIMULATION);}
"location" 											{return symbol(sym.LOCATION);}
"rotation" 											{return symbol(sym.ROTATION);}
"scale"												{return symbol(sym.SCALE);}
"weight" 											{return symbol(sym.WEIGHT);}
"speed"												{return symbol(sym.SPEED);}
"Cube" 												{return symbol(sym.TYPE_FIGURE, new String(yytext()));}
"Sphere" 											{return symbol(sym.TYPE_FIGURE, new String(yytext()));}
"Cone" 												{return symbol(sym.TYPE_FIGURE, new String(yytext()));}
"Cylinder"											{return symbol(sym.TYPE_FIGURE, new String(yytext()));}
"Plane"												{return symbol(sym.TYPE_FIGURE, new String(yytext()));}
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
<<EOF>>   											{System.err.println("Unexpected file end");}
}
