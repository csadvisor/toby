.PHONY: all test watch

all: test

vim:
	vim -o app/views app/controllers/advisee.coffee app/models/petition.coffee

test_unit: 
	if test -d ./test/unit; \
	then \
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--reporter spec \
		./test/unit/*.coffee; \
	fi

test: test_unit
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--reporter spec \
		./test/*.coffee

watch:
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--watch \
		./test/*.coffee
	./node_modules/.bin/brunch watch
