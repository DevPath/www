setup :
		npm install

build :
		./env.sh stylus src/stylesheets/ --out public/css
		./env.sh coffee --compile --output public/js src/coffeescripts

watch-coffeescript :
		./env.sh coffee --watch --compile --output public/js src/coffeescripts

watch-stylus :
		./env.sh stylus src/stylesheets/ -w --out public/css

deploy :
		./env.sh coffee deploy
