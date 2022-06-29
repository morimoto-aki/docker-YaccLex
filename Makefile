calc: calc.tab.c lex.yy.c 
	gcc calc.tab.c lex.yy.c -o calc -ll -ly

calc.tab.c: calc.y
	bison -d calc.y

lex.yy.c: calc.l 
	flex calc.l

clean:
	rm -f calc calc.tab.c calc.tab.h lex.yy.c