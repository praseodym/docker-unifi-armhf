.PHONY: all build push

all: build push

build:
	@docker build --no-cache --pull -t praseodym/unifi-armhf:unifi5 -t praseodym/unifi-armhf:latest .

push:
	@docker push praseodym/unifi-armhf:unifi5
	@docker push praseodym/unifi-armhf:latest
