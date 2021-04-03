%{
    #include <stdlib.h>
    void yyerror(char *);
    #include "y.tab.h" 
%}

%%

[ \t] ;
[0]|[1-9][0-9]*     { yylval=atoi(yytext); return INTEGER; }
"+"                 { return ADD_OP; }
"-"                 { return SUB_OP; }
"*"                 { return MULT_OP; }
"/"                 { return DIV_OP; }
"fi"|"FI"           { return FI_FNC; }
"("                 { return LEFT_BR; }
")"                 { return RIGHT_BR; }
[\n]                { return EOL; }
"exit"              { return EXIT_CMD;}
.                   { yyerror("Allowed characters is only digits: 0-9 and these operands and brackects: + - * / ( ) and function fi(INTEGER) that returns the number of divisors of a given number"); }

%%

int yywrap(void) {
     return 1;
}