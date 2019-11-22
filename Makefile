.PHONY: all list build lint push

DOCKERFILES = $(shell find . -type f -name Dockerfile)
DOCKER_REPOSITORY = ukhydrographicoffice

DATE = $(shell date '+%Y-%m-%d')
GIT_COMMIT_HASH = $(shell git rev-parse --short HEAD)
DOCKER_TAG = $(DATE)-$(GIT_COMMIT_HASH)

all: lint build

### List

list:
	@: $(foreach item,$(DOCKERFILES),$(info $(item)))

### Lint

LINT_DONE_FILES = $(subst Dockerfile,.LINT.DONE,$(DOCKERFILES))

lint: $(LINT_DONE_FILES)

%/.LINT.DONE: %/Dockerfile
	docker run --rm -i hadolint/hadolint < $<
	@touch $@

### Build

BUILD_DONE_FILES = $(subst Dockerfile,.BUILD.DONE,$(DOCKERFILES))

build: $(BUILD_DONE_FILES)

%/.BUILD.DONE: %/Dockerfile
	docker build $*
	@touch $@

### Push

PUSH_DONE_FILES = $(subst Dockerfile,.PUSH.DONE,$(DOCKERFILES))

push: $(PUSH_DONE_FILES)

%/.PUSH.DONE: %/Dockerfile
	$(eval IMAGE_NAME = $(DOCKER_REPOSITORY)/$(shell basename $*))
	docker build -t $(IMAGE_NAME) $*
	docker push $(IMAGE_NAME)
	$(eval VERSIONED_IMAGE_NAME = $(IMAGE_NAME):$(DOCKER_TAG))
	docker build -t $(VERSIONED_IMAGE_NAME) $*
	docker push $(VERSIONED_IMAGE_NAME)
	@touch $@
