%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h"
%}

int ("+"|"-")?[0-9]*
float ("+"|"-")?[0-9]+"."[0-9]+
id [a-zA-Z][a-zA-Z0-9_]*

%%

"debut" return DEBUT;
"fin" return FIN;
":=" return AF;
"+" return ADD;
"-" return SUB;
"/" return DIV;
"*" return MUL;
";" return SEMICOLON;
{int} { yylval = atoi(yytext) ; return int; } 
{float} { yylval = atoi(yytext); return float;}
{id} { yylval = (int)yytext ; return ID; } 
"/*"(.|"\n")+"*/"
[ \t\n]
. printf("Erreur lexicale (%s)",yytext);

%%