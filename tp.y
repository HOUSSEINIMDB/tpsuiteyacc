%{
	#include<stdio.h>
	int flag=0;
	void yyerror (char *s);
	int yylex();
	extern FILE *yyin;
	extern char* yytext;
%}

%token DEBUT FIN AF INT FLOAT ID ADD SUB DIV MUL SEMICOLON

%% 
S:DEBUT ListOper FIN {printf("Debut \n%s\n",$2);};
ListOper: Oper ListOper | Oper;
Oper: ID AF EXP SEMICOLON
|ID AF nb SEMICOLON
|ID AF ID SEMICOLON;
EXP: A ADD A
|A SUB A
|A DIV A
|A MUL A;
A: nb|ID;
nb: INT
|FLOAT;



%%

void main()
{ 
    FILE *fp;
    fp = fopen("tp.txt","r");
    yyin = fp;
    yyparse();
    printf("Sans erreur");
}
void yyerror(char *s) {printf("Erreur : %s\n",s);}