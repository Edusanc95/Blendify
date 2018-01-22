%%
%standalone
%class analex
%state COMMENT

/*--DECLARATIONS --*/ 

%{ 


private Symbol symbol(int type) {

   return new Symbol(type,yyline,yycolumn);
 
}

private Symbol symbol(int type,Object value){ 
	return new Symbol(type,yyline,yycolumn,value); 
} 


%} /* END DECLARATION */ 

/* ---------- Rules and Actions ---------------*/

%%
<YYINITIAL> {
"/*"												{yybegin(COMMENT);}
"*/"												{ /*ERROR*/ }
"begin"												{return symbol(sym.BEGIN);}
"end"												{return symbol(sym.END);}
"declaration"										{return symbol(sym.DECLARATION);}
"scene"												{return symbol(sym.SCENE);}
"action"											{return symbol(sym.ACTION);}
"static"											{return symbol(sym.STATIC_OBJECT);}
"dynamic"											{return symbol(sym.DYNAMIC_OBJECT);}
"{"													{return symbol(sym.LEFTBRACKET);}
"}"													{return symbol(sym.RIGHTBRACKET);}
"="													{return symbol(sym.EQUAL);}
";"													{return symbol(sym.SEMICOLON);}
"start_simulation"									{return symbol(sym.START_SIMULATION);}
[gplane|gspeed|gcollision]							{return symbol(sym.TYPE_GOAL);}
[position|rotation|scale]							{return symbol(sym.VALUE_STATIC);}
[position|rotation|scale|weight|speed]				{return symbol(sym.VALUE_DYNAMIC);}
[Cube|Sphere|Cone|Cylinder|Force_field|Ramp|Plane]	{return symbol(sym.TYPE_FIGURE);}
","													{return symbol(sym.COMMA);}
"("													{return symbol(sym.RIGHTPARENT);}
")"													{return symbol(sym.LEFTPARENT);}
["AND"|"OR"]										{return symbol(sym.CONDITIONAL);}
[a-zA-Z]											{return symbol(sym.ALPHABETIC, new String(yytext()));}
[0-9]+('.'[0-9])+ 									{return symbol(sym.REAL, new Float(yytext()));}
[a-z]+[a-zA-Z0-9_]* 								{return symbol(sym.ID);}
[ \t\n\r\f]	  										{ /* ignora delimitadores */ }
.													{System.err.println("Ilegal character: " + yytext());}
}													/* end YYINITIAL */

<COMMENT> 											{
"*/"	  											{yybegin(YYINITIAL);}
<<EOF>>   											{/*ERROR*/}
"."	  												{}
}
