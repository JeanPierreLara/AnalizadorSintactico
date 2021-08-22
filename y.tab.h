/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ENTERO = 258,
    REAL = 259,
    IDENTIFICADOR = 260,
    IF = 261,
    ELSE = 262,
    FOR = 263,
    WHILE = 264,
    MENOR = 265,
    MAYOR = 266,
    MENORIGUAL = 267,
    MAYORIGUAL = 268,
    COMPARACION = 269,
    DIFERENTE = 270,
    IGUAL = 271,
    PCOMA = 272,
    MAS = 273,
    MENOS = 274,
    ASTERISCO = 275,
    DIVISION = 276,
    PABIERTO = 277,
    INT = 278,
    FLOAT = 279,
    STRING = 280,
    PCERRADO = 281,
    LLAVEABIERTA = 282,
    LLAVECERRADA = 283,
    CADENA = 284,
    COMA = 285,
    INGRESA = 286,
    IMPRIME = 287,
    COUT = 288,
    CIN = 289,
    VOID = 290,
    RETURN = 291,
    MAIN = 292
  };
#endif
/* Tokens.  */
#define ENTERO 258
#define REAL 259
#define IDENTIFICADOR 260
#define IF 261
#define ELSE 262
#define FOR 263
#define WHILE 264
#define MENOR 265
#define MAYOR 266
#define MENORIGUAL 267
#define MAYORIGUAL 268
#define COMPARACION 269
#define DIFERENTE 270
#define IGUAL 271
#define PCOMA 272
#define MAS 273
#define MENOS 274
#define ASTERISCO 275
#define DIVISION 276
#define PABIERTO 277
#define INT 278
#define FLOAT 279
#define STRING 280
#define PCERRADO 281
#define LLAVEABIERTA 282
#define LLAVECERRADA 283
#define CADENA 284
#define COMA 285
#define INGRESA 286
#define IMPRIME 287
#define COUT 288
#define CIN 289
#define VOID 290
#define RETURN 291
#define MAIN 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
