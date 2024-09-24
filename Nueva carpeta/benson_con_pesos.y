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
%token INICIO FIN LEER ESCRIBIR PARENIZQUIERDO PARENDERECHO PUNTOYCOMA COMA ASIGNACION FDT ERRORLEXICO
%token <cadena> ID
%token <num> CONSTANTE
%type <num> expresion
%left SUMA RESTA
%left PRODUCTO COCIENTE MODULO_O_RESTO
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
expresion: CONSTANTE                        {$$ = $1; printf("\n Resultado: %d",$$);}
|ID                                         {$$ = $1; printf("\n Resultado: %d",$$);}
|expresion SUMA expresion                   {$$ = $1 + $3; printf("\n Resultado: %d",$$);}
|expresion SUMA expresion                   {$$ = $1 + $3; printf("\n Resultado: %d",$$);}
|expresion RESTA expresion                  {$$ = $1 - $3; printf("\n Resultado: %d",$$);}
|expresion RESTA expresion                  {$$ = $1 - $3; printf("\n Resultado: %d",$$);}
|expresion PRODUCTO expresion               {$$ = $1 * $3; printf("\n Resultado: %d",$$);}
|expresion PRODUCTO expresion               {$$ = $1 * $3; printf("\n Resultado: %d",$$);}
|expresion COCIENTE expresion               {$$ = $1 / $3; printf("\n Resultado: %d",$$);}
|expresion COCIENTE expresion               {$$ = $1 / $3; printf("\n Resultado: %d",$$);}
|expresion MODULO_O_RESTO expresion         {$$ = $1 % $3; printf("\n Resultado: %d",$$);}
|expresion MODULO_O_RESTO expresion         {$$ = $1 % $3; printf("\n Resultado: %d",$$);}
|PARENIZQUIERDO expresion PARENDERECHO      {$$ = $2; printf("\n Resultado: %d",$$);} 
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