
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INICIO = 258,
     FIN = 259,
     LEER = 260,
     ESCRIBIR = 261,
     PARENIZQUIERDO = 262,
     PARENDERECHO = 263,
     PUNTOYCOMA = 264,
     COMA = 265,
     ASIGNACION = 266,
     SUMA = 267,
     RESTA = 268,
     FDT = 269,
     ERRORLEXICO = 270,
     PRODUCTO = 271,
     COCIENTE = 272,
     MODULO_O_RESTO = 273,
     ID = 274,
     CONSTANTE = 275
   };
#endif
/* Tokens.  */
#define INICIO 258
#define FIN 259
#define LEER 260
#define ESCRIBIR 261
#define PARENIZQUIERDO 262
#define PARENDERECHO 263
#define PUNTOYCOMA 264
#define COMA 265
#define ASIGNACION 266
#define SUMA 267
#define RESTA 268
#define FDT 269
#define ERRORLEXICO 270
#define PRODUCTO 271
#define COCIENTE 272
#define MODULO_O_RESTO 273
#define ID 274
#define CONSTANTE 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 14 "benson.y"

  char* cadena;
  int num;



/* Line 1676 of yacc.c  */
#line 99 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


