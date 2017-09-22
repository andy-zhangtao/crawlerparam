.PHONY: build

export CRAWLER_API_VERSION=v1
export CRAWLER_CALL_BACK=http://10.50.1.10:69400/


build:
	@go build -ldflags "-X main._VERSION_=$(shell date +%Y%m%d)"

run: build
	@./crawlerparam

release: *.go util/*.go crawler/*.go db/*.go
	GOOS=linux GOARCH=amd64 go build -ldflags "-X main._VERSION_=$(shell date +%Y%m%d)" -a -o cralwerparam
	docker build -t vikings/cralwerparam .
	docker push vikings/cralwerparam