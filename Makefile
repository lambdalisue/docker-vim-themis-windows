LANG  := C
CYAN  := \033[36m
GREEN := \033[32m
RESET := \033[0m
IMAGE := lambdalisue/vim-themis-windows
VERSION := latest
ARCH    := x64

ifeq (${VERSION},latest)
    ifeq (${ARCH},x64)
	TAG := latest
    else
	TAG := latest-x86
    endif
else
    ifeq (${ARCH},x64)
	TAG := v${VERSION}
    else
	TAG := v${VERSION}-x86
    endif
endif

# http://postd.cc/auto-documented-makefile/
.DEFAULT_GOAL := help
.PHONY: help
help: ## Show this help
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "${CYAN}%-30s${RESET} %s\n", $$1, $$2}'

.PHONY: image

image: ## Build a docker image
	@echo "${GREEN}Building a docker image (${IMAGE}:${TAG})${RESET}"
	@docker build --no-cache --build-arg TAG=${TAG} -t ${IMAGE}:${TAG} .

.PHONY: pull
pull: ## Pull a docker image
	@echo "${GREEN}Pulling a docker image (${IMAGE}:${TAG})${RESET}"
	@docker pull ${IMAGE}:${TAG}


.PHONY: push
push: ## Push a docker image
	@echo "${GREEN}Pushing a docker image (${IMAGE}:${TAG})${RESET}"
	@docker push ${IMAGE}:${TAG}

.PHONY: shell
shell: ## Enter a docker image
	@echo "${GREEN}Entering a docker image (${IMAGE}:${TAG})${RESET}"
	@docker run --rm --entrypoint cmd -it ${IMAGE}:${TAG}

.PHONY: all
all: ## All
	@make VERSION=8.0.0003 image push
	@make VERSION=8.0.0027 image push
	@make VERSION=8.0.0104 image push
	@make VERSION=8.0.0106 image push
	@make VERSION=8.0.1383 image push
	@make VERSION=8.1.0001 image push
	@make VERSION=8.1.0342 image push
	@make VERSION=8.1.0348 image push
	@make VERSION=8.1.0369 image push
