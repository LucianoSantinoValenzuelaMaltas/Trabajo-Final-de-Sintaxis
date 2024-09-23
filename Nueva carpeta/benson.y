%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define TAMNOM 20+1
extern FILE* yyin;
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
int main(int argc, char** argv) {
  char nomArchi[TAMNOM];
   if ( argc == 1 ){
      printf("Debe ingresar el nombre del archivo fuente (en lenguaje Micro) en la linea de comandos\n");
      return -1;
   }
   else if ( argc != 2 ){
      printf("Numero incorrecto de argumentos\n");
      return -1;
   }
   strcpy(nomArchi, argv[1]);
   int largo_nomArchi = strlen(nomArchi);

   if (largo_nomArchi > TAMNOM ){
        printf("Nombre incorrecto del Archivo Fuente\n");    
        return -1;
    }
    if (nomArchi[largo_nomArchi-1] != 'm' || nomArchi[largo_nomArchi-2] != '.' ){
        printf("Nombre incorrecto del Archivo Fuente\n");
        return -1;
    }

    yyin = fopen(nomArchi, "r");
    if (yyin == NULL ){
        printf("No se pudo abrir archivo fuente\n");
        return -1;
    }

  yyparse();

   return 0;
   fclose(yyin);
}
void yyerror (char *s){
printf("\n Se ha producido un error de tipo %s\n",s);
}
int yywrap()  {
 return 1;
}