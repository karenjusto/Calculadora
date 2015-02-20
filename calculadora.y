%{
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;
extern char * yytext;
extern FILE *yyin;
%}

%union
{
    float real;
}
%token <real> NUM
%token PUNTOCOMA
%token SUMA
%token RESTA
%token MULTIPLICACION
%token DIVISION
%token MODULO
%token POTENCIA
%token PARENTIZQ
%token PARENTDER
%token PUNTOCOMA
%token RAIZ
%token SEN
%token COS
%token TAN
%token ASIGNACION
%token IMPRIMIR
%type <real> Expresion
%left SUMA RESTA
%left MULTIPLICACION DIVISION
%right POTENCIA
%left TKN_SIGNO_MENOS
%start Inicio
%%

Inicio: Inicio Calculadora
										| Calculadora
										;
Calculadora :	
							Expresion PUNTOCOMA { printf("%5.2f\n", $1); };
          
Expresion :  NUM {$$=$1;}|
             Expresion SUMA Expresion {$$=$1+$3;}|
             Expresion RESTA Expresion {$$=$1-$3;}|
             Expresion MULTIPLICACION Expresion {$$=$1*$3;}|
             Expresion DIVISION Expresion {$$=$1/$3;}|
	     TKN_MENOS Expresion %prec TKN_SIGNO_MENOS {$$ = -($2);}
;
%%

int yyerror(char *msg)
{
	printf("%d: %s en '%s'\n", yylineno, msg, yytext);
}

int main(int argc,char **argv)
{
		if(argc>1)
			yyin=fopen(argv[1],"r");
    yyparse();

    printf("Numero lineas analizadas: %d\n", yylineno);
    return (0);
}

