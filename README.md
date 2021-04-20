# prk-2021
fce kalkulačky:
  - celá čísla
  - závorky ()
  - sčítání, odčítání
  - násobení, děleni
  - fce "řecké fí" pfi(number) pro počet dělitelů zadaného čísla, čili prvne udělat prvočíselný rozklad, např pro 648 = (2^3)*(3^4), následně počet dělitelů je d = (3+1)*(4+1) = 20

```
lex calculator.l
yacc -d calculator.y
cc lex.yy.c y.tab.c -o calculator 
```

```
#intestines of makefile
file = calculator

default:
	mkdir -p bin
	lex $(file).l
	yacc -d $(file).y
	cc lex.yy.c y.tab.c -o bin/$(file)

run:
	./bin/$(file)	

clean:
	rm -r bin lex.yy.c y.tab.c y.tab.h
```
