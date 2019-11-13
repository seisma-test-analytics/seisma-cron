MAKEFLAGS+=--silent

DOCKER=`which docker`

DOCKERFILE=Dockerfile

SEISMA_API_REPO_URL=https://github.com/seisma-test-analytics/seisma-api.git

IMAGE_NAME=seisma/cron
IMAGE_TAG?=`./ci/getVersion`

build:
	$(DOCKER) build --build-arg SEISMA_API_REPO_URL=$(SEISMA_API_REPO_URL) -t $(IMAGE_NAME):$(IMAGE_TAG) -f $(DOCKERFILE) .
	$(DOCKER) tag $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):latest

publish:
	$(DOCKER) login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	$(DOCKER) push $(IMAGE_NAME):$(IMAGE_TAG)
	$(DOCKER) push $(IMAGE_NAME):latest
