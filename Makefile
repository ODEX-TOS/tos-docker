DOCKER_USER?=f0xedb
IMAGE_NAME?=tos-base
IMAGE_NAME_USER?=tos
IMAGE_NAME_GUI?=tos-gui


all: all-tos all-user
all-tos: build tag push
all-user: build-user tag-user push-user
all-gui: build-gui tag-gui push-gui

build:
	docker build -t ${IMAGE_NAME} .

build-user:
	docker build -t ${IMAGE_NAME_USER} - < Dockerfile.user

build-gui:
	docker build -t ${IMAGE_NAME_GUI} - < Dockerfile.gui


tag:
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME}:latest

tag-user:
	docker tag ${IMAGE_NAME_USER} ${DOCKER_USER}/${IMAGE_NAME_USER}:latest

tag-gui:
	docker tag ${IMAGE_NAME_GUI} ${DOCKER_USER}/${IMAGE_NAME_GUI}:latest


run:
	docker run -it ${IMAGE_NAME}

run-user:
	docker run -it ${IMAGE_NAME_USER}

run-gui:
	Xephyr -screen ${WIDTH}x${HEIGHT} :1 &
	docker run --net=host --env="DISPLAY=:1" -it --volume="${HOME}/.Xauthority:/root/.Xauthority:rw" --volume="/run/dbus/system_bus_socket:/run/dbus/system_bus_socket" ${IMAGE_NAME_GUI}

push:
	docker push ${DOCKER_USER}/${IMAGE_NAME}

push-user:
	docker push ${DOCKER_USER}/${IMAGE_NAME_USER}

push-gui:
	docker push ${DOCKER_USER}/${IMAGE_NAME_GUI}


clean:
	docker image rm ${IMAGE_NAME}
	docker image rm ${IMAGE_NAME_USER}
	docker image rm ${IMAGE_NAME_GUI}
