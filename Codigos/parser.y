%{
 #include <stdio.h>
  #include <stdlib.h>
  extern int yylex(void);
  extern char *yytext;
  extern int linea;
  extern FILE *yyin;
  void yyerror(char *str);

int yystopparser=0;
%}


%token ENTERO REAL IDENTIFICADOR IF ELSE FOR WHILE MENOR MAYOR MENORIGUAL MAYORIGUAL COMPARACION DIFERENTE IGUAL PCOMA MAS MENOS ASTERISCO DIVISION PABIERTO INT FLOAT STRING PCERRADO LLAVEABIERTA LLAVECERRADA CADENA COMA INGRESA IMPRIME COUT CIN VOID RETURN MAIN

%start Inicio


%%

Inicio		: Funcion Inicio
		| Declaracion Inicio
		| Funcionvacio
		;

Funcion		: INT IDENTIFICADOR PABIERTO Parametro PCERRADO Bloquereturnint
		| FLOAT IDENTIFICADOR PABIERTO Parametro PCERRADO Bloquereturnfloat
		| STRING IDENTIFICADOR PABIERTO Parametro PCERRADO Bloquereturnstring
		| VOID IDENTIFICADOR PABIERTO Parametro PCERRADO Bloque
		;

Funcionvacio	: VOID MAIN PABIERTO Parametro PCERRADO Bloque
		;


Condicionalif	: IF Condicion Bloque 
		| IF Condicion Bloque Condicionalelse
		| IF Condicion Bloque Condicionalif
		;

Condicionalelse : ELSE Condicionalif
		| ELSE Bloque 
		| ELSE Bloque Sentencia
		; 

Buclewhile	: WHILE Condicion Bloque 
		| WHILE Condicion Bloque Sentencia
		;



Condicion	: PABIERTO Valor Operadorrelacional IDENTIFICADOR PCERRADO 
		| PABIERTO IDENTIFICADOR Operadorrelacional Valor PCERRADO 
		| PABIERTO IDENTIFICADOR Operadorrelacional IDENTIFICADOR PCERRADO
		;

Valor		: REAL
		| ENTERO
		;

Operadorrelacional	: MAYOR
			| MENOR
			| MENORIGUAL
			| MAYORIGUAL
			| COMPARACION
			| DIFERENTE
			;

Bloque		: LLAVEABIERTA Sentencia LLAVECERRADA
		| LLAVEABIERTA LLAVECERRADA
		;


Bloquereturnint: LLAVEABIERTA Sentencia RETURN ENTERO PCOMA LLAVECERRADA
		|LLAVEABIERTA Sentencia RETURN IDENTIFICADOR PCOMA LLAVECERRADA
		;

Bloquereturnfloat: LLAVEABIERTA Sentencia RETURN REAL PCOMA LLAVECERRADA
		|LLAVEABIERTA Sentencia RETURN IDENTIFICADOR PCOMA LLAVECERRADA
		;

Bloquereturnstring: LLAVEABIERTA Sentencia RETURN CADENA PCOMA LLAVECERRADA
		|LLAVEABIERTA Sentencia RETURN IDENTIFICADOR PCOMA LLAVECERRADA
		;


Sentencia	: Condicionalif 
		| Buclewhile 
		| Declaracion 
		| Asignacion 
		| Instruccion  
		| Declaracion Sentencia
		| Asignacion Sentencia
		| Instruccion Sentencia
		| LLamadofuncion
		;

Declaracion	: INT IDENTIFICADOR PCOMA
		| FLOAT IDENTIFICADOR PCOMA
		| STRING IDENTIFICADOR PCOMA	
		| INT IDENTIFICADOR Asignaentero
		| FLOAT IDENTIFICADOR Asignareal
		| STRING IDENTIFICADOR Asignacadena
		;

Parametro 	: INT IDENTIFICADOR 
		| FLOAT IDENTIFICADOR
		| STRING IDENTIFICADOR
		| INT IDENTIFICADOR COMA Parametro
		| FLOAT IDENTIFICADOR COMA Parametro
		| STRING IDENTIFICADOR COMA Parametro
		| /*vacio*/
		;

LLamadofuncion	: IDENTIFICADOR PABIERTO Ingresaparametro PCERRADO PCOMA
		;

Ingresaparametro: IDENTIFICADOR COMA Ingresaparametro
		| ENTERO COMA Ingresaparametro
		| REAL COMA Ingresaparametro
		| CADENA COMA Ingresaparametro
		| IDENTIFICADOR 
		| ENTERO 
		| REAL 
		| CADENA 
		| /*vacio*/
		;


Asignacion	: Asignacadena
		| Asignaentero
		| Asignareal
		| Asignaident
		| IDENTIFICADOR IGUAL Operacion
		;

Asignaentero	: IGUAL ENTERO PCOMA
		| IGUAL ENTERO COMA Asignaentero
		| IDENTIFICADOR IGUAL ENTERO COMA Asignaentero
		| IDENTIFICADOR IGUAL ENTERO PCOMA
		;

Asignareal	: IGUAL REAL PCOMA
		| IGUAL REAL COMA Asignareal
		| IDENTIFICADOR IGUAL REAL COMA Asignareal
		| IDENTIFICADOR IGUAL REAL PCOMA
		;

Asignacadena	: IGUAL CADENA PCOMA
		| IGUAL CADENA COMA Asignacadena
		| IDENTIFICADOR IGUAL CADENA COMA Asignacadena
		| IDENTIFICADOR IGUAL CADENA PCOMA
		;
Asignaident	: IDENTIFICADOR IGUAL IDENTIFICADOR PCOMA
		;

Instruccion	: Leer
		| Imprimir
		;

Leer		: CIN INGRESA IDENTIFICADOR PCOMA
		;

Imprimir 	: COUT IMPRIME CADENA PCOMA
		| COUT IMPRIME IDENTIFICADOR PCOMA
		| COUT IMPRIME CADENA IMPRIME Imprimir
		| COUT IMPRIME IDENTIFICADOR IMPRIME Imprimir
		| CADENA PCOMA 
		| IDENTIFICADOR PCOMA
		;

Operadorarit	: MAS
		| MENOS
		| ASTERISCO
		| DIVISION
		;

Operacion 	: IDENTIFICADOR Operadorarit IDENTIFICADOR PCOMA
		| IDENTIFICADOR Operadorarit REAL PCOMA
		| IDENTIFICADOR Operadorarit ENTERO PCOMA
		| REAL Operadorarit IDENTIFICADOR PCOMA
		| REAL Operadorarit REAL PCOMA
		| REAL Operadorarit ENTERO PCOMA
		| ENTERO Operadorarit IDENTIFICADOR PCOMA
		| ENTERO Operadorarit REAL PCOMA
		| ENTERO Operadorarit ENTERO PCOMA
		;




%%

void yyerror(char * str)
{
    fprintf(stderr, "Error: %s, Line %d\n", str, linea);
}

int main(int argc,char **argv)
{
  if (argc>1)
                yyin=fopen(argv[1],"rt");
  else
                yyin=stdin;
  
  yyparse();
  return 0;
}








































