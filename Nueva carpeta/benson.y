%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern char *yytext;
extern int yyleng;
extern int yylex(void);
extern void yyerror(char*);
int variable=0;
%}
%union{
  char* cadena;
  int num;
}
%token INICIO FIN LEER ESCRIBIR PARENIZQUIERDO PARENDERECHO PUNTOYCOMA COMA ASIGNACION SUMA RESTA FDT ERRORLEXICO PRODUCTO COCIENTE MODULO_O_RESTO
%token <cadena> ID
%token <num> CONSTANTE
%%
programa: INICIO listaDeSentencias FIN
;
listaDeSentencias: listaDeSentencias sentencia
|sentencia
;
sentencia: ID {if(yyleng>4) yyerror("sintactico, debido a que supero el limite de 32 bits");} ASIGNACION expresion PUNTOYCOMA
| LEER PARENIZQUIERDO listaDeIDs PARENDERECHO PUNTOYCOMA
| ESCRIBIR PARENIZQUIERDO listaDeExpresiones PARENDERECHO PUNTOYCOMA
;
listaDeIDs: listaDeIDs COMA ID
|ID
;
listaDeExpresiones: listaDeExpresiones COMA expresion
|expresion
;
expresion: primaria
|expresion operadorAditivo primaria
|expresion operadorMultiplicativo primaria
;
primaria: ID
|CONSTANTE {printf("\n Se detecto el valor: %d \n",atoi(yytext)); }
|PARENIZQUIERDO expresion PARENDERECHO
;
operadorAditivo: SUMA
|RESTA
;
operadorMultiplicativo: PRODUCTO
|COCIENTE
|MODULO_O_RESTO
;
%%
int main() {
yyparse();
}
void yyerror (char *s){
printf("\n Se ha producido un error de tipo %s\n",s);
}
int yywrap()  {
 return 1;
}