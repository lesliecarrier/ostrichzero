GCSS_SOURCE=static/gcss/*.gcss
CSS_TARGET=static/css/all.css

css: $(CSS_TARGET)

$(CSS_TARGET): $(GCSS_SOURCE)
	cat $^ | gcss >$@

watch:
	-killall goat
	goat &
	hugo server --buildDrafts --watch
	open http://localhost:1313/

dep:
	go get github.com/yosssi/goat/...
	go get -u github.com/yosssi/gcss/...
