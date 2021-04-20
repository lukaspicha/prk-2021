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
	
