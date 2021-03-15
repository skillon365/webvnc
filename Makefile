.PHONY: build run shell push

build:
	docker build -t webvnc/base     base
	docker build -t webvnc/wine     wine
	docker build -t webvnc/explorer explorer
	docker build -t webvnc/librecad librecad

run: build
	docker run --rm -p 8080:8080 webvnc/librecad

shell: build
	docker run --rm -it -p 8080:8080 webvnc/librecad bash
