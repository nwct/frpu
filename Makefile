export PATH := $(GOPATH)/bin:$(PATH)
export GO15VENDOREXPERIMENT := 1

all: fmt build

build: frps frpc

# compile assets into binary file
file:
	rm -rf ./src/assets/static/*
	cp -rf ./src/web/frps/dist/* ./src/assets/static
	go get -d github.com/rakyll/statik
	go install github.com/rakyll/statik
	rm -rf ./src/assets/statik
	go generate ./src/assets/...

fmt:
	go fmt ./src/assets/...
	go fmt ./src/client/...
	go fmt ./src/cmd/...
	go fmt ./src/models/...
	go fmt ./src/server/...
	go fmt ./src/utils/...
	
frps:
	go build -o bin/frps ./src/cmd/frps
	@cp -rf ./src/assets/static ./bin

frpc:
	go build -o bin/frpc ./src/cmd/frpc

test: gotest

gotest:
	go test -v ./src/assets/...
	go test -v ./src/client/...
	go test -v ./src/cmd/...
	go test -v ./src/models/...
	go test -v ./src/server/...
	go test -v ./src/utils/...

alltest: gotest
	cd ./src/tests && ./src/run_test.sh && cd -
	go test -v ./src/tests/...
	cd ./src/tests && ./src/clean_test.sh && cd -

clean:
	rm -f ./bin/frpc
	rm -f ./bin/frps
	cd ./src/tests && ./src/clean_test.sh && cd -

save:
	godep save ./...
