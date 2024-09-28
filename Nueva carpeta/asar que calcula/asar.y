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
%type <num> expresion primaria
%left SUMA RESTA
%left PRODUCTO COCIENTE MODULO_O_RESTO
%%
programa: INICIO listaDeSentencias FIN
;
listaDeSentencias: listaDeSentencias sentencia
|sentencia
;
sentencia: ID ASIGNACION expresion PUNTOYCOMA
| LEER PARENIZQUIERDO listaDeIDs PARENDERECHO PUNTOYCOMA
| ESCRIBIR PARENIZQUIERDO listaDeExpresiones PARENDERECHO PUNTOYCOMA
;
listaDeIDs: listaDeIDs COMA ID
|ID
;
listaDeExpresiones: listaDeExpresiones COMA expresion
|expresion
;
expresion: primaria                        {$$ = $1;}
|expresion SUMA primaria                   {$$ = $1 + $3; printf("El Resultado de realizar la SUMA entre %d y %d es: %d \n",$1,$3,$$);}
|expresion RESTA primaria                  {$$ = $1 - $3; printf("El Resultado de realizar la RESTA entre %d y %d es: %d \n",$1,$3,$$);}
|expresion PRODUCTO primaria               {$$ = $1 * $3; printf("El Resultado del PRODUCTO entre %d y %d es: %d \n",$1,$3,$$);}
|expresion COCIENTE primaria               {$$ = $1 / $3; printf("El Resultado del COCIENTE entre %d y %d es: %d \n",$1,$3,$$);}
|expresion MODULO_O_RESTO primaria         {$$ = $1 % $3; printf("El RESTO de dividir %d entre %d es: %d \n",$1,$3,$$);}
;
primaria: CONSTANTE                        {$$ = $1; printf("Valor detectado: %d\n",$$);}
|PARENIZQUIERDO expresion PARENDERECHO     {$$ = $2;}
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