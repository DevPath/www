setup :
		npm install

build :
		./env.sh stylus  src/stylesheets/ --out public
		./env.sh coffee --compile --output public src/coffeescripts

watch-coffeescript :
		./env.sh coffee --watch --compile --output public src/coffeescripts

watch-stylus :
		./env.sh stylus src/stylesheets/ -w --out public

deploy :
		./env.sh coffee deploy
