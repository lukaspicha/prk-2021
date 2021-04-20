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
