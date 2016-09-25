HOME := '/root/exercism'
TAG := $(shell basename $(CURDIR))
VOLUME := $(CURDIR):$(HOME)
RUN := run --rm -v $(VOLUME)

EXERCISM_CLI_VERSION := 2.3.0

build:
	docker build -t $(TAG) \
		--build-arg EXERCISM_CLI_VERSION=$(EXERCISM_CLI_VERSION) \
		--build-arg EXERCISM_KEY=$(EXERCISM_KEY) \
		.

bash:
	docker $(RUN) -it $(TAG) bash

clean:
	docker rmi $(TAG)

fetch:
	docker $(RUN) $(TAG) exercism fetch $(EXERCISM_LANG)

test:
	docker run --rm $(TAG) make test

all: build test

.PHONY:
