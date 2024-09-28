%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}
INICIO "INICIO"|"inicio"

FIN "FIN"|"fin"

LEER "LEER"|"leer"

ESCRIBIR "ESCRIBIR"|"escribir"

DIGITO [0-9]

LETRA [a-zA-Z]

IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*

constEntera {DIGITO}({DIGITO})*
%%
{INICIO} {printf("\n\nSe ha detectado la palabra reservada INICIO \n\n\n");return INICIO;}
{LEER} {printf("Se ha detectado la palabra reservada LEER \n");return LEER;}
{ESCRIBIR} {printf("Se ha detectado la palabra reservada ESCRIBIR\n");return ESCRIBIR;}
{FIN} {printf("Se ha detectado la palabra reservada FIN \n");return FIN;}
":=" {printf("Se ha detectado el token ASIGNACION \n");return ASIGNACION;}
{constEntera} {yylval.num=atoi (yytext);return CONSTANTE;}
{IDENTIFICADOR} {printf("Se detecto el IDENTIFICADOR %s \n",yytext);return ID;}
";" {printf("Se ha detectado el caracter de puntuacion PUNTOYCOMA \n\n\n");return PUNTOYCOMA;}
"," {printf("Se ha detectado el caracter de puntuacion COMA \n");return COMA;}
"(" {printf("Se ha detectado el caracter de puntuacion PARENIZQUIERDO \n");return PARENIZQUIERDO;}
")" {printf("Se ha detectado el caracter de puntuacion PARENDERECHO \n");return PARENDERECHO;}
"+" {printf("Se ha detectado el operador aditivo SUMA \n");return SUMA;}
"-" {printf("Se ha detectado el operador aditivo RESTA \n");return RESTA;}
"*" {printf("Se ha detectado el operador multiplicativo PRODUCTO \n");return PRODUCTO;}
"/" {printf("Se ha detectado el operador multiplicativo COCIENTE \n");return COCIENTE;}
"%" {printf("Se ha detectado el operador multiplicativo MODULO_O_RESTO \n");return MODULO_O_RESTO;}
" "
.   {printf("Caracter no reconocido \n");}
%%