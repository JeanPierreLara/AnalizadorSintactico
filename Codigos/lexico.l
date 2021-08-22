%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int linea=1;
%}

%option noyywrap


letra [a-zA-Z]
digito [[:digit:]]

%%
"main"					{return MAIN;}
"void"					{return VOID;}
"return"				{return RETURN;}
"if"					{return IF;}
"else"					{return ELSE;}
"for"					{return FOR;}
"while"					{return WHILE;}
"int"					{return INT;}
"float"					{return FLOAT;}
"string"				{return STRING;}
"cout"					{return COUT;}
"cin"					{return CIN;}
{digito}+				{return ENTERO;}
{digito}+"."{digito}+			{return REAL;}
({letra}|"_")({letra}|("_")|{digito})*		{return IDENTIFICADOR;}
"\""({digito}|{letra}|" ")*"\""	{return CADENA;}
">>"					{return INGRESA;}
"<<"					{return IMPRIME;}
"<="					{return MENORIGUAL;}
">="					{return MAYORIGUAL;}
"=="					{return COMPARACION;}
"!="					{return DIFERENTE;}
"<"					{return MENOR;}
">"					{return MAYOR;}
"="					{return IGUAL;}
";"					{return PCOMA;}
","					{return COMA;}
"+"					{return MAS;}
"-"					{return MENOS;}
"*"					{return ASTERISCO;}
"/"					{return DIVISION;}
"("					{return PABIERTO;}
")"					{return PCERRADO;}
"{"					{return LLAVEABIERTA;}
"}"					{return LLAVECERRADA;}
"\n"       				 {linea++;}
[\t\r\f] 				{}
" "                    			{}
.					{printf("En linea %d: ERROR: Caracter ilegal\n",linea);}

%%


