%{    
    #include "stdio.h"
    #include "stdlib.h"
    #include "math.h"
    void yyerror(char *);     
    int yylex(void);   
    int myDivideFnc(int, int);
    int getNumberOfDivisors(int);
    int getOpposite(int);
    
%} 

%token INTEGER
%token EOL
%token EXIT_CMD
%token FI_FNC
%token LEFT_BR
%token RIGHT_BR
%left ADD_OP
%left SUB_OP
%left MULT_OP
%left DIV_OP

%%

statements:
    statements statement 
    |         
    ; 

statement:
    EOL                             { printf("\n"); }
    | expr EOL                      { printf("Result: %d\n", $$); } 
    | EXIT_CMD EOL                  { exit(1); }
    ;

expr:
    SUB_OP expr                     { $$ = getOpposite($2); }
    | INTEGER                       { $$ = $1; }
    | mult_div_op
    | add_sub_op
    | LEFT_BR expr RIGHT_BR         { $$ = $2; }
    | functions
    ;

add_sub_op:
    expr ADD_OP expr                { $$ = $1 + $3; }
    | expr SUB_OP expr              { $$ = $1 - $3; }
    ;

mult_div_op:
    expr MULT_OP expr               { $$ = $1 * $3; }
    | expr DIV_OP expr              { $$ = myDivideFnc($1, $3); }
    ;

functions:
    FI_FNC expr                     { $$ = getNumberOfDivisors($2); }
    ;

%%

void yyerror(char *s) {
    printf("%s %s\n", "Something went wrong:", s);
} 

int myDivideFnc(int a, int b) {
   
    if(b == 0) {
        yyerror("Dividing by zero.");
    }

    if(a == 0) {
        return 0;
    }
    
    return a / b;
}

int getNumberOfDivisors(int n) {
    n = abs(n);
    if(n < 2) {
        return 1;
    }

    int numberOfDivisors = 0;

    for (int i = 1; i <= sqrt(n); i++) {
        if (n % i == 0) {
            if (n / i == i) {
                numberOfDivisors++;
            } else {
                numberOfDivisors++;
                numberOfDivisors++;
            }
        }
    }

    return numberOfDivisors;
}

int getOpposite(int n) {
    return n * -1;
}
    
int main(void) {
    printf("%s\n", "Calculator. Follow the instructions. For exit type exit.");
    printf("%s\n", "Supported operations: only positive and negative integers and these operands + - * / ln() exp() and (). Spaces and tabs will be ignored.");
    yyparse();
    return 0;
}
