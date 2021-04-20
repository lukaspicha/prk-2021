# prk-2021
fce kalkulačky:
  - celá čísla
  - závorky ()
  - sčítání, odčítání
  - násobení, děleni
  - fce "řecké fí" pfi(number) pro počet dělitelů zadaného čísla, čili prvne udělat prvočíselný rozklad, např pro 648 = (2^3)*(3^4), následně počet dělitelů je d = (3+1)*(4+1) = 20

```
file = calculator

default:
	mkdir -p bin
	lex $(file).l
	yacc -d $(file).y
	cc lex.yy.c y.tab.c -o bin/$(file)

run:
	./bin/$(file)	

clean:
	rm -r bin lex.yy.c y.tab.c y.tab.h temp

test:
	mkdir -p temp
	./bin/$(file) < tests/test-1 >temp/result-1

	cmp -s temp/result-1 tests/result-test-1
	RETVAL=$$?; \
    if [ $$RETVAL -eq 0 ]; then \
            echo "Test 1 is OK!"; \
    else \
            echo "Test 1 is FAILED!"; \
    fi

```
