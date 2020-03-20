DOCKER_USER?=f0xedb
IMAGE_NAME?=tos-base
IMAGE_NAME_USER?=tos

all: all-tos all-user
all-tos: build tag push
all-user: build-user tag-user push-user

build:
	docker build -t ${IMAGE_NAME} .

build-user:
	docker build -t ${IMAGE_NAME_USER} - < Dockerfile.user

tag:
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME}:latest

tag-user:
	docker tag ${IMAGE_NAME_USER} ${DOCKER_USER}/${IMAGE_NAME}:latest

run:
	docker run -it ${IMAGE_NAME}

run-user:
	docker run -it ${IMAGE_NAME_USER}

push:
	docker push ${DOCKER_USER}/${IMAGE_NAME}

push-user:
	docker push ${DOCKER_USER}/${IMAGE_NAME_USER}

clean:
	docker image rm ${IMAGE_NAME}
	docker image rm ${IMAGE_NAME_USER}
