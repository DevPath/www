setup :
		npm install

build :
		rm -rf public && mkdir public
		./env.sh stylus src/stylesheets/ --out public
		./env.sh coffee --compile --output public src/coffeescripts
		./env.sh coffee template

deploy :
		./env.sh coffee deploy
