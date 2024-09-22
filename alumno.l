%{
#include <stdlib.h>
#ifndef yywrap
static int yywrap(void) { return 1;}
#endif
%}
ID       [a-z][a-z0-9]*
MAY	 [A-Z]
%%
[x]?	printf("una equis");
{ID}        	printf( "Un identificador num: %s de longitud %d\n", yytext, yyleng);
%%
int main() {
yylex();
}
