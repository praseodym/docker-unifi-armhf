.PHONY: all build push

VERSION_STABLE  := $(shell curl -sSL http://www.ubnt.com/downloads/unifi/debian/dists/stable/ubiquiti/binary-armhf/Packages.gz  | zgrep Version | sed -rn 's/Version: ([[:digit:]].[[:digit:]].[[:digit:]]+)-.*/\1/p')
VERSION_TESTING := $(shell curl -sSL http://www.ubnt.com/downloads/unifi/debian/dists/testing/ubiquiti/binary-armhf/Packages.gz | zgrep Version | sed -rn 's/Version: ([[:digit:]].[[:digit:]].[[:digit:]]+)-.*/\1/p')

all: build-stable push-stable build-testing push-testing
stable: build-stable push-stable
testing: build-testing push-testing

build-stable:
	@docker build --no-cache --pull --build-arg suite=stable -t praseodym/unifi-armhf:unifi5 -t praseodym/unifi-armhf:stable -t praseodym/unifi-armhf:latest -t praseodym/unifi-armhf:${VERSION_STABLE} .

push-stable:
	@docker push praseodym/unifi-armhf:unifi5
	@docker push praseodym/unifi-armhf:stable
	@docker push praseodym/unifi-armhf:latest
	@docker push praseodym/unifi-armhf:${VERSION_STABLE}

build-testing:
	@docker build --no-cache --pull --build-arg suite=testing -t praseodym/unifi-armhf:testing -t praseodym/unifi-armhf:${VERSION_TESTING} .

push-testing:
	@docker push praseodym/unifi-armhf:testing
	@docker push praseodym/unifi-armhf:${VERSION_TESTING}
