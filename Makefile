DOCKER_USER?=f0xedb
IMAGE_NAME?=tos-base
IMAGE_NAME_TEST?=tos-test-suite
IMAGE_NAME_USER?=tos
IMAGE_NAME_GUI?=tos-gui
WIDTH?=640
HEIGHT?=480
VERSION=`date +'%y.%m.%d'`


all: all-tos all-user all-gui all-test-suite
all-tos: build-no-cache tag push
all-test-suite: build-test-suite-no-cache tag-test-suite push-test-suite
all-user: build-user-no-cache tag-user push-user
all-gui: build-gui-no-cache tag-gui push-gui

build:
	docker build -t ${IMAGE_NAME} .

build-test-suite:
	docker build -t ${IMAGE_NAME} - < Dockerfile.test_suite

build-user:
	docker build -t ${IMAGE_NAME_USER} - < Dockerfile.user

build-gui:
	docker build -t ${IMAGE_NAME_GUI} - < Dockerfile.gui


build-no-cache:
	docker build -t ${IMAGE_NAME} --no-cache .

build-test-suite-no-cache:
	docker build -t ${IMAGE_NAME} --no-cache - < Dockerfile.test_suite

build-user-no-cache:
	docker build -t ${IMAGE_NAME_USER} --no-cache - < Dockerfile.user

build-gui-no-cache:
	docker build -t ${IMAGE_NAME_GUI} --no-cache - < Dockerfile.gui


tag:
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME}:latest
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME}:${VERSION}
	
tag-test-suite:
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME_TEST}:latest
	docker tag ${IMAGE_NAME} ${DOCKER_USER}/${IMAGE_NAME_TEST}:${VERSION}

tag-user:
	docker tag ${IMAGE_NAME_USER} ${DOCKER_USER}/${IMAGE_NAME_USER}:latest
	docker tag ${IMAGE_NAME_USER} ${DOCKER_USER}/${IMAGE_NAME_USER}:${VERSION}

tag-gui:
	docker tag ${IMAGE_NAME_GUI} ${DOCKER_USER}/${IMAGE_NAME_GUI}:latest
	docker tag ${IMAGE_NAME_GUI} ${DOCKER_USER}/${IMAGE_NAME_GUI}:${VERSION}

pull:
	docker pull ${DOCKER_USER}/${IMAGE_NAME}:latest
	docker pull ${DOCKER_USER}/${IMAGE_NAME_TEST}:latest
	docker pull ${DOCKER_USER}/${IMAGE_NAME_USER}:latest
	docker pull ${DOCKER_USER}/${IMAGE_NAME_GUI}:latest

run:
	docker run -it ${IMAGE_NAME}
	
run-test-suite:
	docker run -it ${IMAGE_NAME_TEST}

run-user:
	docker run -it ${IMAGE_NAME_USER}

run-gui:
	Xephyr -screen ${WIDTH}x${HEIGHT} :1 &
	docker run --net=host --env="DISPLAY=:1" -it --volume="${HOME}/.Xauthority:/root/.Xauthority:rw" --volume="/run/dbus/system_bus_socket:/run/dbus/system_bus_socket" --volume="/etc/vconsole.conf:/etc/vconsole.conf" ${IMAGE_NAME_GUI}

push:
	docker push ${DOCKER_USER}/${IMAGE_NAME}:latest
	docker push ${DOCKER_USER}/${IMAGE_NAME}:${VERSION}
	
push-test-suite:
	docker push ${DOCKER_USER}/${IMAGE_NAME_TEST}:latest
	docker push ${DOCKER_USER}/${IMAGE_NAME_TEST}:${VERSION}

push-user:
	docker push ${DOCKER_USER}/${IMAGE_NAME_USER}:latest
	docker push ${DOCKER_USER}/${IMAGE_NAME_USER}:${VERSION}

push-gui:
	docker push ${DOCKER_USER}/${IMAGE_NAME_GUI}:latest
	docker push ${DOCKER_USER}/${IMAGE_NAME_GUI}:${VERSION}

update-keyring:
	curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/repo/BUILD/KEYRING/tos-trusted > keyring/tos-trusted
	curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/repo/BUILD/KEYRING/tos-revoked > keyring/tos-revoked
	curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/repo/BUILD/KEYRING/tos.gpg > keyring/tos.gpg

clean:
	docker image rm --force ${IMAGE_NAME}
	docker image rm --force ${IMAGE_NAME_USER}
	docker image rm --force ${IMAGE_NAME_GUI}
