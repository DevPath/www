setup :
		npm install

build :
		./node_modules/.bin/stylus src/stylesheets/ --out public/css
		./node_modules/.bin/coffee --compile --output public/js src/coffeescripts

watch-coffeescript :
		./node_modules/.bin/coffee --watch --compile --output public/js src/coffeescripts

watch-stylus :
		./node_modules/.bin/stylus src/stylesheets/ -w --out public/css
