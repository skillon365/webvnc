.PHONY: build-all
build-all:	build-base \
			build-terminal \
			build-wine \
			build-dotnet \
			build-explorer \
			build-librecad \

############################################################

.PHONY: build-base base
build-base:
	docker build -t webvnc/base base

base: build-base
	docker run --rm -p 8080:8080 webvnc/base

############################################################

.PHONY: build-terminal terminal
build-terminal: build-base
	docker build -t webvnc/terminal terminal

terminal: build-terminal
	docker run --rm -p 8080:8080 webvnc/terminal

############################################################

.PHONY: build-wine wine
build-wine: build-base
	docker build -t webvnc/wine wine

wine: build-wine
	docker run --rm -p 8080:8080 webvnc/wine

############################################################

.PHONY: build-dotnet dotnet
build-dotnet: build-wine
	docker build -t webvnc/dotnet dotnet

dotnet: build-dotnet
	docker run --rm -p 8080:8080 webvnc/dotnet

############################################################

.PHONY: build-explorer explorer
build-explorer: build-wine
	docker build -t webvnc/explorer explorer

explorer: build-explorer
	docker run --rm -p 8080:8080 webvnc/explorer

############################################################

.PHONY: build-librecad librecad
build-librecad: build-wine
	docker build -t webvnc/librecad librecad

librecad: build-librecad
	docker run --rm -p 8080:8080 webvnc/librecad

