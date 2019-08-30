.PHONY: all list

DOCKERFILES = $(shell find . -type f -name Dockerfile)

all: lint build

### List

list:
	@: $(foreach item,$(DOCKERFILES),$(info $(item)))

### Build

BUILD_DONE = $(subst Dockerfile,.BUILD.DONE,$(DOCKERFILES))

build: $(BUILD_DONE)

%/.BUILD.DONE: %/Dockerfile
	docker build $*
	@touch $@

### Lint

LINT_DONE = $(subst Dockerfile,.LINT.DONE,$(DOCKERFILES))

lint: $(LINT_DONE)

%/.LINT.DONE: %/Dockerfile
	docker run --rm -i hadolint/hadolint < $<
	@touch $@
