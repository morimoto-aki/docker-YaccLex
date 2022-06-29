%{
    #include <stdio.h>
int yylex();
int yyerror(char const *str); 
%}
/* flex で得られたトークンをここに記述する */
%token NUMBER CR
/* 演算子トークンの場合はこちら      
   %left は左結合演算子を記述している 
   後に書いた演算子の方が優先度が高い 
   %left op1 op2 ... のように書くと，これらの結合順位は等しくなる． */
%left ADD 
%left MUL 

%%  /* 以下には文法規則を記述する．*/
input: /* 空文字列 */
     | input line 

line : CR
     | expr CR { printf(">> %d\n", $1); }

expr : term ADD expr {$$ = $1 + $3;} /* $i は i番目のトークンを意味し， $$ は expr に格納される値を意味する */ 
     | term

term : factor

factor: NUMBER
%%

int yyerror(char const *str)
{
    fprintf(stderr, "%s\n", str);
    return 0; 
}
int main (int argc, char *argv[])
{
    return yyparse();
}