.PHONY: all build push

all: build push

build:
	@docker build -t praseodym/unifi-armhf:unifi5 .

push:
	@docker push praseodym/unifi-armhf:unifi5