setup :
		npm install

watch :
		./env.sh wach -o src/**/*, make build

build :
		rm -rf public && mkdir public
		./env.sh stylus src/stylesheets/ --out public
		./env.sh coffee --compile --output public src/coffeescripts
		./env.sh coffee template

deploy :
		./env.sh coffee deploy
