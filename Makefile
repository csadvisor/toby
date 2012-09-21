.PHONY: all test watch

all: test

vim:
	vim -o app/views app/controllers app/models/petition.coffee

#test_unit: 
#	@NODE_PATH=`pwd`/app if test -d ./test/unit; \
#	then \
#	./node_modules/.bin/mocha \
#		--compilers coffee:coffee-script \
#		--reporter spec \
#		./test/unit/*.coffee; \
#	fi

#test: test_unit
test:
	@NODE_PATH=/home/csadvisor/petitions/app ./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--reporter spec \
		./test/unit/*.coffee

watch:
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script \
		--watch \
		./test/*.coffee
	./node_modules/.bin/brunch watch

push:
	cp ./public/index.html ../toby/application/views/index.php
	#rsync ./public/stylesheets ../toby/application/stylesheets
	#rsync ./public/javascripts ../toby/application/javascripts
	cp -r ./public/stylesheets ../toby/application/stylesheets
	cp -r ./public/javascripts ../toby/application/javascripts
