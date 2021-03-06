setup :
		npm install

build :
		rm -rf public && mkdir public
		cp src/vendor/*.js public/
		./env.sh stylus src/stylesheets/style.styl --out public
		./env.sh coffee --compile --output public src/coffeescripts
		./env.sh coffee template

server :
		make build && ./env.sh http-server public/

watch :
		make build && ./env.sh wach -o src/**/*, make build

deploy :
		make build && ./env.sh coffee deploy
