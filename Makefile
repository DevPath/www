setup :
		npm install

watch :
		make build
		./env.sh wach -o src/**/*, make build

build :
		rm -rf public && mkdir public
		cp -r src/vendor public/
		./env.sh stylus src/stylesheets/style.styl --out public
		./env.sh coffee --compile --output public src/coffeescripts
		./env.sh coffee template

serve :
		make build
		./env.sh http-server public/

deploy :
		./env.sh coffee deploy
