%option yylineno
%{
#include "calculadora.tab.h"
%}
ENTERO [0-9]+
FLOTANTE {ENTERO}+"."{ENTERO}+
SUMA "+"
RESTA "-"
MULTIPLICACION "*"
DIVISION "/"
MODULO "%"
POTENCIA "^"
PARENTIZQ "("
PARENTDER ")"
PUNTOCOMA ";"
RAIZ raiz
SEN sen
COS cos
TAN tan
ASIGNACION "="
IMPRIMIR imprimir
%%
 //dejando {} crea una regla que no hace nada
 //lo que manda a pantalla, son cadenas que no reconoce
{ENTERO} 		{yylval.real=atof(yytext); return NUM;}
{FLOTANTE}		{yylval.real=atof(yytext); return NUM;}
{SUMA}			{return SUMA;}
{RESTA}			{return RESTA;}
{MULTIPLICACION}	{return MULTIPLICACION;}
{DIVISION}		{return DIVISION;}
{MODULO}		{return MODULO;}
{POTENCIA}		{return POTENCIA;}
{PARENTIZQ}		{return PARENTIZQ;}
{PARENTDER}		{return PARENTDER;}
{PUNTOCOMA}		{return PUNTOCOMA;}
{RAIZ}			{return RAIZ;}
{SEN}			{return SEN;}
{COS}			{return COS;}
{TAN}			{return TAN;}
{ASIGNACION}	{return ASIGNACION;}
{IMPRIMIR}	{return IMPRIMIR;}
" "|\t|\n		{}
.			{return ERROR;}
%%

