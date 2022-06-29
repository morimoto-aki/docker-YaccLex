%option noyywrap
%{ /* 必要な C のコードを書く*/
#include "calc.tab.h"
%}
/* 定義 */
/* もし必要なら，ここにトークンの正規表現を記述する */
/* 次のように記述：*/
/*   definition_name definition */

WHITE_SPACE [ \t]

/* 入力文字列をトークンに分割する */
%% 
{WHITE_SPACE} {/* 空白を読み飛ばす */}
"+" {return ADD;}  /* 加算演算子 */ 
"*" {return MUL;}  /* 加算演算子 */ 
"\n" {return CR;}
[0-9]+ {
    yylval = atoi(yytext); 
    return NUMBER;}

%% 