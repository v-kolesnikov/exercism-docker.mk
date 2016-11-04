.DEFAULT_GOAL := test

HOME := /root/exercism
TAG := $(shell basename $(CURDIR))
VOLUME := $(CURDIR):$(HOME)
RUN := run --rm -v $(VOLUME)
DOCKER_RUN := docker $(RUN) $(TAG)

EXERCISM_CLI_VERSION := 2.3.0

# Project API
install:: build

clean:: rm

test:: ;

# Docker API
build:
	docker build -t $(TAG) \
		--build-arg EXERCISM_CLI_VERSION=$(EXERCISM_CLI_VERSION) \
		--build-arg EXERCISM_KEY=$(EXERCISM_KEY) \
		.

rm:
	docker rmi $(TAG)

bash:
	docker $(RUN) -it $(TAG) bash

# Exercism cli API
fetch:
	$(DOCKER_RUN) exercism fetch $(EXERCISM_LANG)

submit:
	$(DOCKER_RUN) exercism submit lib/exercism/$(EXERCISM_LANG)/${EXERCISE}

status:
	$(DOCKER_RUN) exercism status $(EXERCISM_LANG)

.PHONY: test
