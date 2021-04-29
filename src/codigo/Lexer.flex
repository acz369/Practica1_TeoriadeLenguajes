package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z]+
D=[0-9]+
espacio=[ ]+
%{
    public String lexeme;
%}
%%
int |
if |
for |
break |
else |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"%" {return Modulo;}
"==" {return Equivalencia;}
"!=" {return Diferente;}
"<=" {return MenorIgual;}
">=" {return MayorIgual;}
">" {return Mayor;}
"<" {return Menor;}
";"|
"{"|
"}"|
"("|
")" {lexeme=yytext(); return Separador;}
char {lexeme=yytext(); return Caracter;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
