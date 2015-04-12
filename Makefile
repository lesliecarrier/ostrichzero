GCSS_SOURCE=static/gcss/*.gcss
CSS_TARGET=static/css/all.css

css: $(CSS_TARGET)

$(CSS_TARGET): $(GCSS_SOURCE)
	cat $^ | gcss >$@

watch:
	rm -rf ./public
	-killall goat
	goat &
	hugo server --buildDrafts --watch
	open http://localhost:1313/

dep:
	go get github.com/yosssi/goat/...
	go get -u github.com/yosssi/gcss/...

build-container:
	hugo
	docker build -t lesliecarrier/ostrichzero .

destroy-container:
	-docker kill ostrichzero.com
	-docker rm ostrichzero.com

run-container:
	docker run -d -p 5006:80 --name ostrichzero.com lesliecarrier/ostrichzero

sync-images:
	./deploy.sh
