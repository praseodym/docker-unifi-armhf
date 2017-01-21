.PHONY: all build push

VERSION:=$(shell curl -sSL http://www.ubnt.com/downloads/unifi/debian/dists/unifi5/ubiquiti/binary-armhf/Packages.gz | zgrep Version | sed -rn 's/Version: ([[:digit:]].[[:digit:]].[[:digit:]])-.*/\1/p')

all: build push

build:
	@docker build --no-cache --pull -t praseodym/unifi-armhf:unifi5 -t praseodym/unifi-armhf:latest -t praseodym/unifi-armhf:${VERSION} .

push:
	@docker push praseodym/unifi-armhf:unifi5
	@docker push praseodym/unifi-armhf:latest
	@docker push praseodym/unifi-armhf:${VERSION}
